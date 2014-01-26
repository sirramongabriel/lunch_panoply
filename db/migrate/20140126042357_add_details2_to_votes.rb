class AddDetails2ToVotes < ActiveRecord::Migration
  def change
  	change_column :votes, :votable_id, 
  end
end
