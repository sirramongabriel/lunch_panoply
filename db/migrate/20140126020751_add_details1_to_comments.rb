class AddDetails1ToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_id, :integer
  end
end
