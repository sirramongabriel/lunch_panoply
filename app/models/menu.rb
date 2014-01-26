class Menu < ActiveRecord::Base
	has_many :menu_items
	belongs_to :venue
end
