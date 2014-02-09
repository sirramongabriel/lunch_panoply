class Company < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip

  validates_presence_of :name, :address, :city, :state, :zip, :phone 

  validates_length_of :state, is: 2, too_long: 'please enter a two character state abbreviation',
  										too_short: 'please enter a two character state abreviation'

  validates_length_of :zip, within: 5..9, too_long: 'please enter no more than 9 characters',
                      too_short: 'please enter at least 5 characters'

  validates_length_of :phone, is: 10, too_long: 'please enter no more than 10 digits', 
  										too_short: 'please enter a 10 digit number'

  belongs_to :employee


  # def Company.total
  # end

  # def Company.by_name
  #   Company.all.order(name: :asc)
  # end

  def Company.by_newest_first
   Company.all.order(created_at: :desc)
  end

  def Company.by_oldest_first
    Company.all.order(created_at: :asc)
  end

  def Company.by_city
    Company.all.order(city: :asc)
  end

  def Company.by_state
    Company.all.order(state: :asc)
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

class InvalidCompany < Company
  attr_accessible :name, :address, :city, :state, :zip, :phone

  has_many :employees
end
