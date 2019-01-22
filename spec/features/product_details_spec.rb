require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

 before :each do
   @category = Category.create! name: 'Apparel'

   @item = @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 64.99
     )

 end

 scenario "They see single product" do

   # ACT
   visit root_path
   find('.product header a').click


   # DEBUG
   save_and_open_screenshot

   #VERIFY
   expect(page).to have_css 'article.product-detail', count:1
   expect(page).to have_current_path(product_path(@item.id))


 end

end