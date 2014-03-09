class AddMenuIdToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :menu_id, :integer
  end
end
