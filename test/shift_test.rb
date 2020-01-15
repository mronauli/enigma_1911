require './test/test_helper'
require './lib/offset'
require './lib/key'
require './lib/shift'

class ShiftTest < Minitest::Test
  def test_shift_exists
    shift = Shift.new(key = ["12", "23", "34", "45"], offset = ["0", "4", "0", "0"])
    assert_instance_of Shift, shift
  end
end
