class CreateMenuItemsRetrievers < ActiveRecord::Migration
  def change
    create_table :menu_items_retrievers do |t|

      t.timestamps
    end
  end
end
