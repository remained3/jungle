require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
 # SETUP
 before :each do
  @category = Category.create! name: 'Apparel'


    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      quantity: 10,
      image: open_asset('apparel1.jpg'),
      price: 64.99
    )
  end

  scenario "they they add a product to cart and the cart increases to one " do
    #ACT
    visit root_path

    #VERIFY
    expect(page).to have_content('My Cart (0)')

    #Act
    click_button('Add')

    #VERIFY
    expect(page).to have_content('My Cart (1)')

    # DEBUG
    save_screenshot
  end

end 