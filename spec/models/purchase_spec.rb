require 'rails_helper'

RSpec.describe Purchase, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:purchaser_name) }
    it { is_expected.to validate_presence_of(:item_count) }
  end

  context 'relationships' do
    it { is_expected.to belong_to :item }
    it { is_expected.to belong_to :merchant }
  end
end
