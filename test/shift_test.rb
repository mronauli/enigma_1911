require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_shift_exists
    shift = Shift.new(["12", "23", "34", "45"], ["0", "4", "0", "0"])
    assert_instance_of Shift, shift
  end

  def test_shift_has_keys_and_offsets
    shift = Shift.new(["12", "23", "34", "45"], ["0", "4", "0", "0"])
    assert_equal ["12", "23", "34", "45"], shift.keys
    assert_equal ["0", "4", "0", "0"], shift.offsets
  end
end
