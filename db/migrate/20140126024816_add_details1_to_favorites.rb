class AddDetails1ToFavorites < ActiveRecord::Migration
  def change
  	add_column :favorites, :favoritable_type, :string
  end
end
