class CreatePurchaseListUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_list_uploads do |t|

      t.timestamps
    end
  end
end
