require "secp256k1"
require "bigdecimal"
require "httparty"
require "json"
require_relative "../lib/atproto/origin"
require_relative "secret_input"

B58BT = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

class Array
  def to_base58
    r = ""
    n = BigDecimal(0)
    each do |byte|
      n = n * 256 + byte
    end
    loop do
      r += B58BT[n % 58]
      n /= 58
      break if n == 0
    end
    r.reverse
  end
end

posix = File::ALT_SEPARATOR.nil?

home = begin
  Dir.home
rescue ArgumentError
  nil
end
key_directory = ENV["BSKYRB_KEY_DIR"] || (home && File.join(home, ".bskyrb"))
abort "Cannot determine where to store the recovery key: set HOME or BSKYRB_KEY_DIR." unless key_directory

created_directory = false
begin
  Dir.mkdir(key_directory, 0o700)
  created_directory = true
rescue Errno::EEXIST
  # Validate the existing path below before storing any key material in it.
rescue SystemCallError => e
  abort "Cannot create the recovery key directory #{key_directory}: #{e.message}"
end

# File.stat follows symlinks (e.g. a dotfile-manager layout); ownership and
# permission checks only apply on POSIX systems.
directory_stat = File.stat(key_directory)
raise "Recovery key path is not a directory: #{key_directory}" unless directory_stat.directory?

if posix
  unless directory_stat.uid == Process.euid
    raise "Refusing to store the recovery key in a directory owned by another user: #{key_directory}"
  end

  if created_directory
    File.chmod(0o700, key_directory)
  elsif (directory_stat.mode & 0o077) != 0
    raise "Recovery key directory is accessible by other users (run `chmod 700 #{key_directory}`): #{key_directory}"
  end
end

print "On which server do you want to register (just press Enter if you're clueless what that means)? "
host = (STDIN.gets || "").chomp
print "What's your email? "
email = (STDIN.gets || "").chomp
print "What handle do you want? "
handle = (STDIN.gets || "").chomp
password = prompt_new_password
print "And finally: What's your invite code? "
invite_code = (STDIN.gets || "").chomp

host = "https://bsky.social" if host.empty?
host = "https://#{host}" unless host.match?(%r{\A[a-z][a-z0-9+.-]*://}i)
begin
  host = ATProto::Origin.normalize(host)
rescue ArgumentError => e
  abort "Invalid server: #{e.message}"
end

# Generate and store the recovery key only after every answer has been
# checked, so a typo (e.g. an invalid server) never leaves an unused key file.
key = Secp256k1::PrivateKey.new
public_key = key.pubkey
compressed_public_key = public_key.serialize(compressed: true)
did = "did:key:z#{(Bytes[0xe7, 0x1] + compressed_public_key).to_base58}"

fn = File.join(key_directory, "#{did.split(":")[-1]}.key")
puts "Storing the private key for '#{did}' in #{fn}."
flags = File::WRONLY | File::CREAT | File::EXCL | (defined?(File::BINARY) ? File::BINARY : 0)
key_file_created = false
begin
  File.open(fn, flags, 0o600) do |key_file|
    key_file_created = true
    key_file.binmode
    if posix
      key_file.chmod(0o600)
      unless (key_file.stat.mode & 0o777) == 0o600
        raise "Recovery key file does not have owner-only permissions: #{fn}"
      end
    end

    key_file.write(key.private_key)
    key_file.flush
    key_file.fsync
  end
rescue StandardError
  # Don't leave an empty or partial key file behind that could be mistaken for a backup.
  File.delete(fn) if key_file_created && File.exist?(fn)
  raise
end

puts "Stored the private key for '#{did}' in #{fn}.\nKeep it safe and secure!"
headers = {
  "Content-Type" => "application/json"
}
body = {
  :handle => handle,
  :password => password,
  :email => email,
  "inviteCode" => invite_code,
  "recoveryKey" => did
}.to_json
response = HTTParty.post("#{host}/xrpc/com.atproto.server.createAccount", headers: headers, body: body)
jres = JSON.parse(response.body)
if jres["error"]
  puts "Couldn't create the account, because… #{jres["error"]}: #{jres["message"] || "???"}"
  puts "The key has not been removed, in case account creation was somehow successful - but that's unlikely :("
else
  puts "Hooray! All good."
  puts "IMPORTANT: Back up the private key from #{fn} to secure, encrypted storage and do not share it!"
end
