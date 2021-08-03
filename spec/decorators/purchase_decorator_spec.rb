require 'rails_helper'

RSpec.describe PurchaseDecorator do
  describe '#created_at' do
    let(:purchase) { build_stubbed(:purchase, created_at: Date.current) }
    subject { purchase.decorate.created_at }

    it { is_expected.to eql purchase.created_at.strftime('%d/%m/%Y %H:%M') }
  end

  describe '#item_price' do
    let(:item) { create(:item, price: 5.0 )}
    subject { Purchase.new(item_id: item.id).decorate.item_price }

    it { is_expected.to eq 'R$ 5.0' }
  end
end
