class CreateFavorites < ActiveRecord::Migration
  def change
  	remove_column :favorites, :id
  	add_column :favorites, :favoritable_id, :primary_key, null: false
  end
end
