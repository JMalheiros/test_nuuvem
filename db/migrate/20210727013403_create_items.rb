class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :description, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
