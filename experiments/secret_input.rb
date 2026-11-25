require "io/console"

# Reads a line from +input+, without echo when it is a terminal.
# Uses input.gets (not Kernel#gets) so ARGV filenames are never read.
def read_secret(input = STDIN)
  value = input.tty? ? input.noecho(&:gets) : input.gets
  puts if input.tty?
  (value || "").chomp
end

# Prompts twice (hidden) until two non-empty entries match.
def prompt_new_password(input = STDIN)
  loop do
    print "What password do you want to use? "
    first = read_secret(input)
    print "Repeat the password: "
    second = read_secret(input)
    return first if !first.empty? && first == second

    puts "Passwords were empty or did not match, please try again."
    abort "No password given." if input.eof?
  end
end
