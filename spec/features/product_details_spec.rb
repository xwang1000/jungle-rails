require 'rails_helper'

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

  scenario 'Clicking on a product on home page' do 
    # EXERCISE
    visit root_path

    within('.product:nth-child(1)') do
      click_on('Details')
    end

    # DEBUG
    save_screenshot
    puts page
    # VERIFY
    expect(page).to have_css '.product-detail'
  end
end
