require "checkout"
require "discount"
require "product"

describe Checkout do 

    # Initialize Checkout
    def new_checkout
      c = Checkout.new
      c.add_item_to_database("CF1", 11.23)
      c.add_item_to_database("AP1", 6.00)
      c.add_item_to_database("CH1", 3.11)
      c.add_item_to_database("MK1", 4.75)
      c.add_discount("AP1", "APPL", 1.50, :discount_at_quantity, limit: 3)
      c.add_discount("CF1", "BOGO", 11.23, :buy_one_get_one_free, limit: 100)
      c.add_discount("MK1", "CHMK", 4.75, :get_something_free, limit: 1, for_product: "CH1")
      c
    end





    context "calculates the correct sum" do
      it "print_cart returns 16.61" do
        c = new_checkout
        c.scan("CH1")
        c.scan("AP1")
        c.scan("AP1")
        c.scan("AP1")
        c.scan("MK1")
        expect(c.print_cart).to eql(16.61)
      end

      it "print_cart returns 20.34" do
        c = new_checkout
        c.scan("CH1")
        c.scan("AP1")
        c.scan("CF1")
        c.scan("MK1")
        expect(c.print_cart).to eql(20.34)
      end

      it "print_cart returns 20.34" do
        c = new_checkout
        c.scan("CF1")
        c.scan("CF1")
        expect(c.print_cart).to eql(11.23)
      end

      it "print_cart returns 20.34" do
        c = new_checkout
        c.scan("MK1")
        c.scan("AP1")
        expect(c.print_cart).to eql(10.75)
      end
    end

 
end 