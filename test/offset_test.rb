require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_offset_exists
    offset = Offset.new("010419")
    assert_instance_of Offset, offset
  end

  def test_offset_has_a_date
    offset = Offset.new("010419")
    assert_equal "010419", offset.date
  end

  def test_can_square_the_date
    offset = Offset.new("010419")
    assert_equal 108555561, offset.square
  end

  def test_can_get_last_for_digits_of_squared_date
    offset = Offset.new("010419")
    assert_equal ["5", "5", "6", "1"], offset.last_four
  end

  def test_do_offset_calculation_if_date_is_not_provided
    offset = Offset.new
    assert_equal ["4", "4", "0", "0"], offset.last_four
  end
end
