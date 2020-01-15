require 'date'

class Offset
  attr_reader :date
  def initialize(date = Time.now.strftime("%d%m%y").to_i)
    @date = date
  end

  def square
    (@date.to_i * @date.to_i)
  end

  def last_four
    square.to_s.chars.last(4)
  end
end
