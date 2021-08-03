class PurchaseListUploadsController < ApplicationController
  
  def new
    @purchase_list_upload = PurchaseListUpload.new
  end

  def create
    begin
      @purchase_list_upload = PurchaseListUpload.new(purchase_list_upload_params)
      if @purchase_list_upload.save
        PurchaseCreator.perform(list: @purchase_list_upload)
        redirect_to purchases_path, notice: t('notices.created', model: Purchase.model_name.human)+t('notices.income', income: @purchase_list_upload.total_income)
      else
        render :new
      end
    rescue
      redirect_to new_purchase_list_upload_path, alert: t('notices.empty', attribute: PurchaseListUpload.human_attribute_name(:file))
    end
    end


    private

    def purchase_list_upload_params
      params.require(:purchase_list_upload).permit(:file)
    end
  end
