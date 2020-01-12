require 'date'

class Offset
  attr_reader :date
  def initialize(date = nil)
    @date = date
  end

  def square
    if @date == nil
      @date = Time.now.strftime("%d%m%y").to_i
    end
    (@date.to_i * @date.to_i)
  end

  def last_four
    square.to_s.chars.last(4)
  end
end
