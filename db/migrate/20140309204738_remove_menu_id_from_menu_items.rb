class RemoveMenuIdFromMenuItems < ActiveRecord::Migration
  def up
    remove_column :menu_items, :menu_id
  end

  def down
    add_column :menu_items, :menu_id, :integer
  end
end
