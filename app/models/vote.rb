class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: true, primary_key: 'votable_id'
end
