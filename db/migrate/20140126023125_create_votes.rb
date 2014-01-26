class CreateVotes < ActiveRecord::Migration
  def change
  	remove_column :votes, :id
  	add_column :votes, :votable_id, :primary_key, null: false
  end
end
