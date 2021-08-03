class AddPurchaseListUploadIdToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :purchase_list_upload_id, :bigint, index: true, foreign_key: true
  end
end
