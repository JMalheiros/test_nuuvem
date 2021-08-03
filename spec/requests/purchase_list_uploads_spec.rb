require 'rails_helper'

RSpec.describe "PurchaseListUploads", type: :request do
  describe "GET /new" do
    before { get "/purchase_list_uploads/new" }
    
    it "returns a sucessful response", aggregate_failures: true do
      expect(response).to be_successful
      expect(response).to render_template(:new)
      expect(assigns(:purchase_list_upload)).to be_a_new(PurchaseListUpload)
    end
  end

  describe "POST /create" do
    context 'with valid attributes' do
      let!(:params) { attributes_for(:purchase_list_upload) }

      it "creates a new purchase_list_upload" do
        expect { post "/purchase_list_uploads/", params: { purchase_list_upload: params } }.to change(PurchaseListUpload, :count).by(1)
      end

      it "returns a redirect response" do
        post "/purchase_list_uploads/", params: { purchase_list_upload: params }

        expect(response).to redirect_to(purchases_path)
      end
      
      it "calls PurchaseCreator" do
        expect(PurchaseCreator).to receive(:perform)
        post "/purchase_list_uploads/", params: { purchase_list_upload: params }
      end
    end

    context 'with invalid attributes' do
      let!(:invalid_params) { attributes_for(:purchase_list_upload, file: nil) }

      it 'returns the correct response' do
        post '/purchase_list_uploads/', params: { purchase_list_upload: invalid_params }

        expect(response).to render_template(:new)
      end

      it 'does not create a new purchase_list_upload' do
        expect { post '/purchase_list_uploads/', params: { purchase_list_upload: invalid_params} }.not_to change(PurchaseListUpload, :count)
      end
    end

    context 'without attributes' do
       it 'returns the correct response' do
        post '/purchase_list_uploads/', params: nil

        expect(response).to redirect_to(new_purchase_list_upload_path)
      end

      it 'does not create a new purchase_list_upload' do
        expect { post '/purchase_list_uploads/', params: nil }.not_to change(PurchaseListUpload, :count)
      end
    end
  end
end
