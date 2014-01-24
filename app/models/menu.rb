class Menu < ActiveRecord::Base
	has_many :menu_items
	has_one :venue, through: :menu_items
end
