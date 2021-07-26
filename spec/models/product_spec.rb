require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    describe 'Product Name' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        pp @product
        expect(@product.name).to be_present
      end
    end
    describe 'Product Price' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.price).to be_present
      end
    end
    describe 'Product Quantity' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.quantity).to be_present
      end
    end
    describe 'Product Category' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.category).to be_present
      end
    end

  end

end
