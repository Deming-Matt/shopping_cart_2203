require './lib/product'
require './lib/shopping_cart'
require 'pry'

RSpec.describe ShoppingCart do
  context "Iteration 2" do
    it "exists" do
      cart = ShoppingCart.new("King Soopers", "30items")

      expect(cart.name).to eq "King Soopers"
      expect(cart.capacity).to eq 30
      expect(cart.products).to eq []
    end

    it "can add products and to the cart" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      cart.add_product(product1)
      cart.add_product(product2)

      expect(cart.products).to eq [product1, product2]
      # expect(cart.details).to eq({:name "King Soopers", :capacity 30})
    end

    it "can show the total number of products and if cart is full" do
      cart = ShoppingCart.new("King Soopers", "30items")
      product1 = Product.new(:paper, 'toilet paper', 3.70, '10')
      product2 = Product.new(:meat, 'chicken', 4.50, '2')
      product3 = Product.new(:paper, 'tissue paper', 1.25, '1')
      cart.add_product(product1)
      cart.add_product(product2)
      cart.add_product(product3)
      # binding.pry
      expect(cart.total_number_of_products).to eq 13
      expect(cart.is_full?).to eq false
      product4 = Product.new(:produce, 'apples', 0.99, '20')
      cart.add_product(product4)
      expect(cart.is_full?).to eq true
      expect(cart.products_by_category(:paper)).to eq [product1, product3]
    end

  end

end