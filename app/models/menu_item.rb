require 'net/http'
require 'uri'
require 'open-uri'
require 'httparty'

class MenuItem < ActiveRecord::Base
  include HTTParty
  include MenuItemsRetriever
  # format :json
  format :html

  attr_accessible :calories, :price, :title

  belongs_to :menu
  belongs_to :venue

  has_many :comments
  has_many :employees, through: :comments
  has_many :favorites
  has_many :employees, through: :favorites
 
  has_many :menu_item_ingredients
  has_many :ingredients, through: :menu_item_ingredients

  has_many :images

  validates_presence_of :title, :price, :calories

  def retrieve
    
  end

  def MenuItem.find_by_state
    
  end

  # def MenuItem.total
  # end

  def MenuItem.by_title
  end

  def MenuItem.by_title_reverse
  end

  def MenuItem.by_calories_low_first
  end

  def MenuItem.by_calories_high_first
  end

  def MenuItem.by_price_low_first
  end

  def MenuItem.by_price_high_first
  end

  def send_request
    send_request
  end
end
