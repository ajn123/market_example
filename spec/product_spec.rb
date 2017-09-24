require "product"

describe Product do
	 describe ".formatted_cost" do
    context "formats a product and a price" do
      it "returns correct spacing" do
       # expect(Product.formatted_cost("CF1", 11.23)).to eql("CF1                 11.23")
      end
    end
    context "formats a discount type and a discount" do
      it "returns correct spacing" do
     #   expect(Product.formatted_discount("APPL", -1.50)).to eql("         APPL        -1.50")
      end
    end

    context "returns the correct cost" do
      it "returns cost" do
      	p = Product.new("AP1", 3.11)
       # expect(p.print_item).to eql(3.11)
      end
    end
  end
end