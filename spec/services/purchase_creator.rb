require 'rails_helper'

RSpec.describe PurchaseCreator do
  let!(:purchase_list_upload) { create(:purchase_list_upload) }
  let(:instance) { double(:instance) }
  subject { described_class.new(list: purchase_list_upload) }
  
  describe '.perform' do
    it 'instatiate and calls perform' do
      expect(described_class).to receive(:new).with(list: purchase_list_upload).and_return(instance)
      expect(instance).to receive(:perform)

      described_class.perform(list: purchase_list_upload)
    end
  end

  describe '#perform' do
    it 'creates new purchases' do
      expect{subject.perform}.to change(Purchase, :count).by(4)
    end
  end
end
