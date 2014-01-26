class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :employee_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
