require 'rails_helper'

RSpec.feature "Visitor clicks on one of the products to got to new page", type: :feature, js: true do
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

      scenario "they see all products " do
        #ACT
        visit root_path

        #VERIFY
        find('a.btn-default').click
        expect(page).to have_content('Description')

        # DEBUG
        save_screenshot
      end

  end