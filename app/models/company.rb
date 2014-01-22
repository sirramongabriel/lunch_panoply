class Company < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip

  validates_presence_of :name, :address, :city, :state, :zip, :phone

  validates_length_of :state, is: 2, too_long: 'please enter a two character state abbreviation',
  										too_short: 'please enter a two character state abreviation'

  validates_length_of :zip, within: 5..9, too_long: 'please enter no more than 9 characters',
                      too_short: 'please enter at least 5 characters'

  validates_length_of :phone, is: 10, too_long: 'please enter no more than 10 digits', 
  										too_short: 'please enter a 10 digit number'

  has_many :employees

  def Company.total
  end

  def Company.by_name
  end

  def Company.by_address
  end

  def Company.by_city
  end

  def Company.by_state
  end

  def Company.by_zip
  end

  def Company.first_favorite_venue
  end

  def Company.second_favorite_venue
  end

  def Company.third_favorite_venue
  end

  def Company.first_favorite_menu_item
  end

  def Company.second_favorite_menu_item
  end

  def Company.third_favorite_menu_item
  end
end
