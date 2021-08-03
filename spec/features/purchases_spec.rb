require 'rails_helper'

RSpec.feature Purchase do
  given!(:purchase_list_upload) { create(:purchase_list_upload) }
  given!(:purchase1) { create(:purchase, purchase_list_upload_id: purchase_list_upload.id)}
  given!(:purchase2) { create(:purchase, purchase_list_upload_id: purchase_list_upload.id) }
  
  scenario 'list purchases' do
    visit root_path
    
    
    expect(page).to have_content purchase1.purchaser_name
    expect(page).to have_content purchase1.purchaser_name
    expect(page).to have_content purchase1.item_description
    expect(page).to have_content purchase1.item_count
    expect(page).to have_content purchase1.decorate.item_price
    expect(page).to have_content purchase1.merchant_name
    expect(page).to have_content purchase1.merchant_address
    expect(page).to have_content purchase1.decorate.created_at
    
    expect(page).to have_content purchase2.item_description
    expect(page).to have_content purchase2.item_count
    expect(page).to have_content purchase2.decorate.item_price
    expect(page).to have_content purchase2.merchant_name
    expect(page).to have_content purchase2.merchant_address
    expect(page).to have_content purchase2.decorate.created_at
    
    expect(page).to have_content purchase_list_upload.total_income
    
    expect(page).to have_link 'New'
  end
end
