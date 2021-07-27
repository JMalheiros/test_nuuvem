class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.text :address
      t.string :name, null: false

      t.timestamps
    end
  end
end
