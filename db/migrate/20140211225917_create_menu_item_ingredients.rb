class CreateMenuItemIngredients < ActiveRecord::Migration
  def change
    create_table :menu_item_ingredients do |t|
      t.string   :quantity
      t.integer  :ingredient_id, null: false
      t.integer  :menu_item_id, null: false

      t.timestamps
    end
    add_index(:menu_item_ingredients, :ingredient_id)
    add_index(:menu_item_ingredients, :menu_item_id)
  end
end
