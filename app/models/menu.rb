class Menu < ActiveRecord::Base
	belongs_to :venue
	has_many :menu_items, as: :menuable
end
