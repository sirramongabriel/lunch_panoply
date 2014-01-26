class RemoveDetails3FromComments < ActiveRecord::Migration
  def up
  	remove_column :comments, :id
  	remove_column :comments, :commentable_id
  end

  def down
  end
end
