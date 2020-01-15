require './test/test_helper'
require 'mocha/minitest'
require './lib/offset'
require './lib/key'
require './lib/shift'
require './lib/enigma'

class KeyTest < Minitest::Test
  def test_enigma_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_has_an_alphabet_with_27_characters
    enigma = Enigma.new
    expected =
    ["a", "b", "c", "d", "e", "f", "g", "h",
      "i", "j", "k", "l", "m", "n", "o", "p",
      "q", "r", "s", "t", "u", "v", "w", "x",
      "y", "z", " "]

    assert_equal expected, enigma.alphabet
    assert_equal 27, enigma.alphabet.length
  end

  def test_encrypt
    enigma = Enigma.new
    my_key = Key.new
    offset = Offset.new("010419")
    shift = Shift.new(["12", "23", "34", "45"], ["0", "4", "0", "0"])
    assert_instance_of Key, my_key
    assert_instance_of Offset, offset
    assert_instance_of Shift, shift
  end

  def test_decrypt
    enigma = Enigma.new
    my_key = Key.new
    offset = Offset.new("010419")
    shift = Shift.new(["12", "23", "34", "45"], ["0", "4", "0", "0"])
    assert_instance_of Key, my_key
    assert_instance_of Offset, offset
    assert_instance_of Shift, shift
  end
end
