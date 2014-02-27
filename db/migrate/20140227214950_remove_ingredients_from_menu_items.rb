class RemoveIngredientsFromMenuItems < ActiveRecord::Migration
  def change
    remove_column :menu_items, :ingredient1
    remove_column :menu_items, :ingredient2
    remove_column :menu_items, :ingredient3
    remove_column :menu_items, :ingredient4
    remove_column :menu_items, :ingredient5
    remove_column :menu_items, :ingredient6
    remove_column :menu_items, :ingredient7
    remove_column :menu_items, :ingredient8
    remove_column :menu_items, :ingredient9
    remove_column :menu_items, :ingredient10
    remove_column :menu_items, :ingredient11
    remove_column :menu_items, :ingredient12
    remove_column :menu_items, :ingredient13
    remove_column :menu_items, :ingredient14
    remove_column :menu_items, :ingredient15
    remove_column :menu_items, :ingredient16
    remove_column :menu_items, :ingredient17
    remove_column :menu_items, :ingredient18
    remove_column :menu_items, :ingredient19
    remove_column :menu_items, :ingredient20
    remove_column :menu_items, :price
    remove_column :menu_items, :img1
    remove_column :menu_items, :img2
    remove_column :menu_items, :img3
    remove_column :menu_items, :img4
    remove_column :menu_items, :img5
  end
end
