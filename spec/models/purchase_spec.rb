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

  context 'delegates' do
    it { is_expected.to delegate_method(:price).to(:item).with_prefix }
    it { is_expected.to delegate_method(:description).to(:item).with_prefix }
    it { is_expected.to delegate_method(:address).to(:merchant).with_prefix }
    it { is_expected.to delegate_method(:name).to(:merchant).with_prefix }
  end
end
