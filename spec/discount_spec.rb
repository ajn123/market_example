require "discount"

describe Discount do 

d2 = Discount.new("AP1", "APPL", 1.50, :discount_at_quantity, limit: 3)
d1 = Discount.new("CF1", "BOGO", 11.23, :buy_one_get_one_free, limit: 100)
d = Discount.new("MK1", "CHMK", 4.75, :get_something_free, limit: 1, for_product: "CH1")

   context "formats a product and a price" do
      it "returns correct spacing" do
        expect(d1.run_discount(2, { "CF1":2})).to eql(0)
        expect(d1.run_discount(2, { "CF1":2})).to eql(-11.23)
      end
    end
    

    context "formats a product and a price" do
      it "returns correct spacing" do
        expect(d2.run_discount(3, { "AP1":3})).to eql(-1.5)
      end
    end

    context "formats a product and a price" do
      it "returns correct spacing" do
        expect(d.run_discount(1, { "CH1" => 1, "MK1" => 1})).to eql(-4.75)
        expect(d.run_discount(1, { "CH1" => 1, "MK1" => 1})).to eql(0)
      end
    end
  
  
end