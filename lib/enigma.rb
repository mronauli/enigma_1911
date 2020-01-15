class Enigma
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def encrypt(message, key = nil, date = nil)
    my_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(my_key.combine, offset.last_four)
  end

  def decrypt(message, key, date = nil)
    my_key = Key.new(key)
    offset = Offset.new(date)
    shift = Shift.new(my_key.combine, offset.last_f)
  end
end
