require 'rails_helper'

RSpec.describe PurchaseListUpload, type: :model do
  context 'relationships' do
    it { is_expected.to have_many :purchases }
    it { is_expected.to have_many(:merchants).through(:purchases) }
    it { is_expected.to have_many(:items).through(:purchases) }
    it { is_expected.to have_one_attached(:file) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :file }
  end

  context '#total_income' do
    let(:purchase_list_upload) { create(:purchase_list_upload)}
    let!(:purchase1) { create(:purchase, purchase_list_upload_id: purchase_list_upload.id) }
    let!(:purchase2) { create(:purchase, purchase_list_upload_id: purchase_list_upload.id) }

    it 'return uplaod total_income' do
      expect(purchase_list_upload.total_income).to eq((purchase1.item_price*purchase1.item_count) + (purchase2.item_price*purchase2.item_count))
    end
  end
end
