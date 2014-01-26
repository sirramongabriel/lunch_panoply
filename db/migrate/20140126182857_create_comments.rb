class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      t.integer :employee_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
