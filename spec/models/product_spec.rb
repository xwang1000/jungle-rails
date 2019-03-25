require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'returns true when saving a product with four fields' do
      @category = Category.create!(name: 'Test')
      @product = @category.products.new(name: 'hi', price: 100, quantity: 1)
      
      expect(@product.save).to eq true
    end

    it 'returns false when saving a product with nil name' do
      @category = Category.create!(name: 'Test')
      @product = @category.products.new(name: nil, price: 100, quantity: 1)

      expect(@product.save).to eq false
    end

    it 'returns false when saving a product with nil price' do
      @category = Category.create!(name: 'Test')
      @product = @category.products.new(name: 'hi', price: nil, quantity: 1)

      expect(@product.save).to eq false
    end

    it 'returns false when saving a product with nil quantity' do
      @category = Category.create!(name: 'Test')
      @product = @category.products.new(name: 'hi', price: 100, quantity: nil)

      expect(@product.save).to eq false
    end

    it 'returns false when saving a product with nil category' do
      @product = Product.new(name: 'hi', price: 100, quantity: 1, category: nil)

      expect(@product.save).to eq false
    end

  end
end
