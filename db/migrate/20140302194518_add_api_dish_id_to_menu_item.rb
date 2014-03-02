class AddApiDishIdToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :api_dish_id, :integer
  end
end
