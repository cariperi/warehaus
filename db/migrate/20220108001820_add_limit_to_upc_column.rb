class AddLimitToUpcColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :upc, :string,  limit: 12
  end
end
