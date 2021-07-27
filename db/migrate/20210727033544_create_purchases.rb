class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :purchaser_name, null: false
      t.integer :item_count, null: false

      t.timestamps
    end
  end
end
