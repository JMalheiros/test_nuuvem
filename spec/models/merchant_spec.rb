require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
  end

  context 'relationships' do
    it { is_expected.to have_many :purchases }
  end
end
