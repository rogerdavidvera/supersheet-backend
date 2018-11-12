class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :tags
      t.string :url
      t.integer :product_sheet_id

      t.timestamps
    end
  end
end
