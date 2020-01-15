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

  def test_enigma_can_encrypt
    enigma = Enigma.new
    assert_equal ({:encryption=>"keder ohulw!", :key=>"02715", :date=>"040895"}), enigma.encrypt("Hello world!", "02715", "040895")
  end

  def test_enigma_can_decrypt
    enigma = Enigma.new
    expected = {:decryption=>"hello world!", :key=>"02715", :date=>"040895"}
    assert_equal expected, enigma.decrypt("keder ohulw!", "02715", "040895")
  end

  def test_can_encrypt_if_no_key_is_passed_in
    enigma = Enigma.new
    refute_equal ({:encryption=>"keder ohulw!", :key=>"02715", :date=>"040895"}), enigma.encrypt("Hello world!", "040895")
  end

  def test_if_no_date_is_given_can_encrypt_with_todays_date
    enigma = Enigma.new
    expected = {:encryption=>"xescd cfglk!", :key=>"12345", :date=>"150120"}
    assert_equal expected, enigma.encrypt("Hello world!", "12345")
  end

  def test_can_decrypt_with_todays_date
    enigma = Enigma.new
    enigma.stubs(:encryption).returns("xescd cfglk!")
    expected = {decryption: "hello world!", key: "12345", date: "150120"}
    assert_equal expected, enigma.decrypt("xescd cfglk!", "12345")
  end

  def test_can_encrypt_message_with_random_key_and_todays_date
    enigma = Enigma.new
    expected_key = Key.new("20667")
    Enigma.stub :encrypt, Key.new("20667") do
    expected = ({:encryption=>"eoxyljhaovp", :key=>"20667", :date=>"150120"})
    assert_equal expected, enigma.encrypt("hello world")
    end
  end
end
