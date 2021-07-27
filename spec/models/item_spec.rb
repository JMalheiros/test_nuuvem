require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :description }
  end
end
