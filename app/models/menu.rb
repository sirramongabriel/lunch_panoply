class Menu < ActiveRecord::Base
  attr_accessible :venue_id

  validates_presence_of :venue_id

	has_many :menu_items
	belongs_to :venue
end
