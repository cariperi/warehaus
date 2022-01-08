class AddValidationToItemModel < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:items, :name, false)
    change_column_null(:items, :quantity, false)
    change_column_null(:items, :upc, false)
    change_column_null(:items, :description, false)
    change_column_null(:items, :price, false)
    change_column_null(:items, :weight, false)
  end
end
