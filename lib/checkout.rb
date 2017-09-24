
class Checkout 
	attr_accessor :item_count
	attr_accessor :discounts
	attr_accessor :products

	def initialize
		@cart = []
		@item_count = Hash.new(0)
		@discounts = {}
		@products = {}
	end

	def add_discount(product, code, amount, type, options = {})
		@discounts[product] = Discount.new(product, code, amount, type, options)
	end

	def add_item_to_database(code, cost)
		@products[code] = cost
	end

	def check_for_discount(code)
		if @discounts.key?(code)
			return @discounts[code].run_discount(@item_count[code], @item_count)
		else
			return 0
		end
	end

	def scan(item)
		@item_count[item] += 1
		@cart << Product.new(item, @products[item])
	end


	def print_cart
		sum = 0
		puts sprintf("%-20s%5s", "Item", "Price")
		puts sprintf("%-20s%5s", "----", "-----")
		@cart.each do |item|
		  sum += item.print_item
		  sum += check_for_discount(item.code)
		end
		puts "-" * 25
		puts sprintf("%25.2f", sum)
		sum
	end
	
end
