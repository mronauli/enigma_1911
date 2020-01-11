require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_offset_exists
    offset = Offset.new("011020")
    assert_instance_of Offset, offset
  end

  def test_offset_has_a_date
    offset = Offset.new("011020")
    assert_equal "011020", offset.date
  end

  def test_can_square_the_date
    offset = Offset.new("011020")
    assert_equal 121440400, offset.square
  end

  def test_can_get_last_for_digits_of_squared_date
    offset = Offset.new("011020")
    assert_equal ["0", "4", "0", "0"], offset.last_four
  end
end
