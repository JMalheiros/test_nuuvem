require 'rails_helper'

RSpec.feature PurchaseListUpload do
  given!(:purchase_list_upload) { create(:purchase_list_upload) }
  
  scenario 'upload purchase_list' do
    visit root_path
    click_link 'New'
    
    expect(page).to have_link 'Back'

    attach_file 'File', "#{Rails.root}/spec/fixtures/files/test_tab.tab"
    click_button 'Submit'

    expect(page).to have_content 'Purchase was sucessfully created'
    expect(page).to have_content purchase_list_upload.total_income


  end
end
