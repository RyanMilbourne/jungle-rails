require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'validates that a new product can be saved' do
      testCategory = Category.create(name: 'Test Category')
      product = Product.new({name: 'Eucalyptus', quantity: 100,  price: 100.00, category: testCategory})
      expect(product.save).to be true
    end

    it 'validates that a product must have a name' do
      testCategory = Category.create(name: 'Test Category')
      product = Product.new({name: nil, quantity: 100,  price: 100.00, category: testCategory})
      expect(product.save).to eq(false)
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates that a product must have a price' do
      testCategory = Category.create(name: 'Test Category')
      product = Product.new({name: 'Eucalyptus', quantity: 100, category: testCategory})
      expect(product.save).to eq(false)
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates that a product must have a quantity' do
      testCategory = Category.create(name: 'Test Category')
      product = Product.new({name: 'Eucalyptus', price: 100.00, category: testCategory})
      expect(product.save).to eq(false)
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates that a product must have a category' do
      testCategory = Category.create(name: 'Test Category')
      product = Product.new({name: 'Eucalyptus', quantity: 100,  price: 100.00})
      expect(product.save).to eq(false)
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end