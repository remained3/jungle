require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) {
    Category.create(name: "testingCat")
  }
 subject {
    category.products.create(
      name: "test",
      description: "example",
      image: "picture",
      price_cents: 5000,
      quantity: 12,
    )
}

  describe "Validations" do

  it 'should save product successfully if it has a name, price, quanity and category' do
  expect(subject).to be_valid
  expect(subject.errors.full_messages).to be_empty
end

it 'it should invalid if name is blank' do
  @product = subject 
  @product.name = nil 
  expect(@product).to_not be_valid
  expect(@product.errors.full_messages).to include "Name can't be blank"
end

it 'it should be invalid if the price is blank' do
  @product2 = subject 
  @product2.price_cents = nil 
  expect(@product2).to_not be_valid
  expect(@product2.errors.full_messages).to include "Price can't be blank"
end

it 'it should be invalid if the quantity is blank' do
  @product3 = subject 
  @product3.quantity = nil 
  expect(@product3).to_not be_valid
  expect(@product3.errors.full_messages).to include "Quantity can't be blank"


end
it 'it should be invalid if the category is blank' do
  @product4 = Product.create(
    name: "test",
    price_cents: 9001,
    quantity: 20,
  )

  expect(@product4).to_not be_valid
  expect(@product4.errors.full_messages).to include "Category can't be blank"
end
end
end