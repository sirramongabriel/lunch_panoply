class Company < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :state, :zip

  validates :name, presence: true
end
