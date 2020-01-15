class Shift
  attr_reader :keys, :offsets
  def initialize(key, offset)
    @keys = key
    @offsets = offset
  end
end
