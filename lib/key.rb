class Key
  attr_accessor :numbers
  def initialize(numbers = nil)
    @numbers = numbers
    if numbers == nil
      @numbers = Array.new(5){rand(10)}
    else
      @numbers = numbers.chars
    end
  end

  def combine
    num_array = []
    @numbers.each_cons(2) do |num|
      num_array << num.join
    end
    num_array
  end
end
