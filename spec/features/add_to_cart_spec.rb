require 'rails_helper'

require 'rails_helper'

RSpec.feature "Add to Cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Users can click add to cart" do
    # ACT
    visit root_path

    #check for zero count for cart
    expect(page).to have_text 'My Cart (0)'
    save_screenshot
    product = page.first(".product")
    product.find_button('Add').click
    #check for count increment for cart
    save_screenshot
  
  # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
  
end
