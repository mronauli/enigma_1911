require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/key'

class KeyTest < Minitest::Test
  def test_key_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_random_numbers_array
    key = Key.new
    random_numbers = mock([1, 2, 3, 34])
    assert_equal random_numbers, key.numbers
  end

  def test_no_numbers_are_double_digits
    key = Key.new
    key.numbers.each do |key|
      assert_equal 0, key/10
    end
  end

  def test_random_numbers_array
    key = Key.new
    assert_equal 5, key.numbers.length
  end

  def test_can_group_numbers_in_pairs
    key = Key.new
    key.stubs(:numbers).returns([1, 2, 3, 4, 5])
    key.numbers = [1, 2, 3, 4, 5]
    assert_equal ["12", "23", "34", "45"], key.combine
  end
end
