class Venue < ActiveRecord::Base
  attr_accessible :address, :city, :email, :fax, :name, :phone, :state, :zip

  has_many :menus
  has_many :menu_items, through: :menus

  validates_presence_of :name
  validates :state, length: { is: 2 }

  def Venue.total
  end

  def Venue.by_join_newest_first
  end

  def Venue.by_join_oldest_first
  end

  def Venue.by_name_asc
  end

  def Venue.by_name_desc
  end

  def Venue.by_city
  end

  def Venue.by_state
  end

  def Venue.by_zip
  end
end

class InvalidVenue < Venue
  attr_accessible :address, :city, :email, :fax, :name, :phone, :state, :zip
end
