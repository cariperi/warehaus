class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :text

      t.timestamps
    end
    add_index :tags, :text
  end
end
