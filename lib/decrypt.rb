require './lib/enigma'

enigma = Enigma.new
file = File.new(ARGV[0], "r")
message = file.read
decrypted_message = enigma.decrypt(message.chomp, ARGV[2], ARGV[3])
new_file = File.new(ARGV[1], "w")
new_file.write(decrypted_message[:decryption])
file.close
new_file.close
puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
