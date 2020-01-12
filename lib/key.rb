class Key
  attr_accessor :numbers
  def initialize
    @numbers = Array.new(5){rand(10)}
  end

  def combine
    num_array = []
    @numbers.each_cons(2) do |num|
      num_array << num.join
    end
    num_array
  end
end
