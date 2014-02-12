class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :menu_item_id, null: false
      t.string  :url
      t.string  :name

      t.timestamps
    end
    add_index(:images, :menu_item_id)
  end
end
