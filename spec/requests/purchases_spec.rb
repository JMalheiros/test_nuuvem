require 'rails_helper'

RSpec.describe "Purchases", type: :request do
  let!(:purchase1) { create(:purchase) }
  let!(:purchase2) { create(:purchase) }

  describe "GET /index" do
    before { get "/purchases" }

    it 'assigns all purchases' do
      expect(assigns(:purchases)).to eq [purchase1, purchase2]
    end
  end
end
