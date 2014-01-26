class AddDetails4ToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commentable_id, :primary_key, null: false
  end
end
