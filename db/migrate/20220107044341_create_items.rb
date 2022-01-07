class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quantity
      t.string :upc
      t.string :description
      t.integer :price
      t.integer :weight

      t.timestamps
    end
    add_index :items, :name
    add_index :items, :upc
  end
end
