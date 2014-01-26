class Favorite < ActiveRecord::Base
	belongs_to :favoritable, polymorphic: true, primary_key: 'favoritable_id'
end
