
class Product

  attr_accessor :code

  def initialize(code, cost)
    @code = code 
    @cost = cost
  end

  def self.formatted_cost(code, cost)
    sprintf("%-18s%7s", code, cost)
  end

  def self.formatted_discount(code, discount)
    sprintf("%13s%12.2f", code, discount)
  end

  def print_item
    puts Product.formatted_cost(@code, @cost)
    @cost
  end

end
