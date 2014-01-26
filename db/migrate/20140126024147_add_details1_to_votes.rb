class AddDetails1ToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :votable_type, :string
  end
end
