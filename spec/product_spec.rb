
require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it "is valid with valid attributes" do
      category = Category.new(name: 'Shoeees')
      product = Product.new(
      name: 'Cool', price: 48.00, quantity: 12, category: category)
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      category = Category.new(name: 'Shoeees')
      product = Product.new(
      name: nil, price: 48.00, quantity: 12, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      category = Category.new(name: 'Shoeees')
      product = Product.new(
      name: 'Cool', price: nil, quantity: 12, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      category = Category.new(name: 'Shoeees')
      product = Product.new(
      name: 'Cool', price: 48.00, quantity: nil, category: category)
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      category = Category.new(name: 'Shoeees')
      product = Product.new(
      name: 'Cool', price: 48.00, quantity: 12, category: nil)
      expect(product).to_not be_valid
      puts product.errors.full_messages
    end

  end
end