class AddDetails1ToMenuItems < ActiveRecord::Migration
  def up
    add_column :menu_items, :venue_id, :integer
    add_column :menu_items, :course, :string
    add_column :menu_items, :description, :text
    add_column :menu_items, :carbohydrates, :string
    add_column :menu_items, :protein, :string
    add_column :menu_items, :fat, :string
    add_column :menu_items, :vegetarian, :boolean
    add_column :menu_items, :paleo, :boolean
    add_column :menu_items, :vegan, :boolean
    add_column :menu_items, :gluten_free, :boolean
    add_column :menu_items, :bal, :boolean
    add_column :menu_items, :low_cal, :boolean
    add_column :menu_items, :low_carb, :boolean
    add_column :menu_items, :low_fat, :boolean
    add_column :menu_items, :hi_protein, :boolean
    add_column :menu_items, :price_cents, :string
    add_column :menu_items, :name, :string
    add_column :menu_items, :full_image_path, :string
  end

  def down
    drop_column :menu_items
  end
end
