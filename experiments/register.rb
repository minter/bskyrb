require "secp256k1"
require "bigdecimal"
require "httparty"
require "json"

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

key = Secp256k1::PrivateKey.new
public_key = key.pubkey
compressed_public_key = public_key.serialize(compressed: true)

did = "did:key:z#{(Bytes[0xe7, 0x1] + compressed_public_key).to_base58}"
key_directory = File.join(Dir.home, ".bskyrb")
begin
  Dir.mkdir(key_directory, 0o700)
rescue Errno::EEXIST
  # Validate the existing path below before storing any key material in it.
end

directory_stat = File.lstat(key_directory)
unless directory_stat.directory? && directory_stat.uid == Process.euid
  raise "Refusing to store the recovery key in unsafe directory #{key_directory}"
end

File.chmod(0o700, key_directory)
unless (File.stat(key_directory).mode & 0o777) == 0o700
  raise "Recovery key directory does not have owner-only permissions: #{key_directory}"
end

fn = File.join(key_directory, "#{did.split(":")[-1]}.key")
flags = File::WRONLY | File::CREAT | File::EXCL
File.open(fn, flags, 0o600) do |key_file|
  key_file.chmod(0o600)
  unless (key_file.stat.mode & 0o777) == 0o600
    raise "Recovery key file does not have owner-only permissions: #{fn}"
  end

  key_file.write(key.private_key)
  key_file.flush
  key_file.fsync

  unless (key_file.stat.mode & 0o777) == 0o600
    raise "Recovery key file permissions changed while writing: #{fn}"
  end
end

puts "Stored the private key for '#{did}' as a hexstring in #{fn}.\nKeep it safe and secure!"
print "On which server do you want to register (just press Enter if you're clueless what that means)? "
host = (gets || "").chomp
print "What's your email? "
email = (gets || "").chomp
print "What handle do you want? "
handle = (gets || "").chomp
print "What password do you want to use? "
password = (gets || "").chomp
print "And finally: What's your invite code? "
invite_code = (gets || "").chomp

host = "https://bsky.social" if host.empty?
host = "https://#{host}" unless host.start_with?("http")
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
