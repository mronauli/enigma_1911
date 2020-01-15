require './lib/key'
require './lib/offset'
require './lib/shift'

class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    my_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(my_key.combine, offset.last_four)

    counter = 4

    encrypted = ""

    characters = message.downcase.chars
    characters.each do |char|
      index = @alphabet.find_index(char)
      which_offset = counter % 4
        if index != nil
          new_index = (index + shift.offsets[which_offset].to_i + shift.keys[which_offset].to_i) % @alphabet.length
          encrypted += @alphabet[new_index]
        else
        encrypted += char
    end
      counter += 1
    end
    {:encryption => encrypted, :key => my_key.numbers.join(""), :date => offset.date}
  end

  def decrypt(message, key, date = nil)
    my_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(my_key.combine, offset.last_four)

    counter = 4

    decrypted = ""

    message.chars.each do |char|
      index = @alphabet.find_index(char)
      which_offset = counter % 4
        if index != nil
          new_index = (index - shift.offsets[which_offset].to_i - shift.keys[which_offset].to_i) % @alphabet.length
          decrypted += @alphabet[new_index]
        else
          decrypted += char
      end
      counter += 1
    end
    {:decryption => decrypted, :key => my_key.numbers.join(""), :date => offset.date}
  end
end
