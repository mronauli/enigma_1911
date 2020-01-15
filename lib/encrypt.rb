require './lib/enigma'

enigma = Enigma.new
file = File.new(ARGV[0], "r")
message = file.read
encrypted_message = enigma.encrypt(message.chomp)
new_file = File.new(ARGV[1], "w")
new_file.write(encrypted_message[:encryption])
file.close
new_file.close
puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}."
