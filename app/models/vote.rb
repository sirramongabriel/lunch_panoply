class Vote < ActiveRecord::Base
	attr_accessible :votable_type
	
	belongs_to :votable, polymorphic: true, primary_key: 'votable_id'
end
