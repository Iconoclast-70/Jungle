require 'rails_helper'
require 'pp'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "Can navigate from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path
    
    click_link @category.products[0].name
  
    # VERIFY
    expect(page).to have_css 'div.col-sm-8'
  end

end
