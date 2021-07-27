require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    describe 'Product Name' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.name).to be_present
      end
      it "should be invalid if name is nil" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: nil, description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product).to be_invalid
        expect(@product.errors.full_messages[0]).to eql('Name can\'t be blank')
      end
    end
    describe 'Product Price' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.price).to be_present
      end
      it "should be invalid if price is nil" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price: nil, category: @category)
        expect(@product).to be_invalid
        expect(@product.errors.full_messages[0]).to eql('Price cents is not a number')
      end
    end
    describe 'Product Quantity' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.quantity).to be_present
      end
      it "should be invalid if quantity is nil" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: nil, price: 26, category: @category)
        expect(@product).to be_invalid
        expect(@product.errors.full_messages[0]).to eql('Quantity can\'t be blank')
      end
    end
    describe 'Product Category' do
      it "should exist" do
        @category = Category.new(name: 'Electronics')
        @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price:20, category: @category)
        expect(@product.category).to be_present
      end
    end
    it "should be invalid if catgegory is nil" do
      @category = Category.new(name: 'Electronics')
      @product = Product.new(name: 'CD', description: 'New Maiden Album', quantity: 1, price: 26, category: nil)
      expect(@product).to be_invalid
      expect(@product.errors.full_messages[0]).to eql('Category can\'t be blank')
    end
    

  end

end
