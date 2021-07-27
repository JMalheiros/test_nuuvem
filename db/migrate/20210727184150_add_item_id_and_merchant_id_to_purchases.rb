class AddItemIdAndMerchantIdToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :item_id, :bigint, index: true, foreign_key: true
    add_column :purchases, :merchant_id, :bigint, index: true, foreign_key: true
  end
end
