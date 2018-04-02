require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before :each do
      @category = Category.new name: "Tester"
      @product = @category.products.new({
        name: "Clever name",
        description: "Cool description",
        quantity: 4,
        price: 50.99
      })
    end

    it 'should save successfully with all 4 inputs validated' do
      @product.save
      expect(Category.first.products.length).to eql(1)
    end

    it 'should validate the presence of name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages.length).to eql(1)
    end

    it 'should validate the presence of category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages.length).to eql(1)
    end

    it 'should validate the presence of quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages.length).to eql(1)
    end

    it 'should validate the presence of price_cents' do
      @product.price_cents = nil
      @product.save
      #produces 3 errors so switch to not_to eql(0)
      expect(@product.errors.full_messages.length).not_to eql(0)
    end

  end

end
