require 'net/http'
require 'uri'
require 'open-uri'
require 'httparty'
require 'menu_items_retriever'

class MenuItem < ActiveRecord::Base
  include HTTParty
  format :json
  # format :html

  attr_accessible :calories, :venu_id, :course, :description, :carbohydrates,
                  :protein, :fat, :vegetarian, :paleo, :vegan, :gluten_free,
                  :bal, :low_cal, :low_carb, :low_fat, :hi_protein, :price_cents,
                  :name, :full_image_path

  # belongs_to :menu_items_retriever
  # delegate :all, :gluten_free, :hi_protein, :paleo, :vegan, :vegetarian, 
  #          to: :menu_items_retriever
  
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

  def initialize()
    @menu_items_retriever = MenuItemsRetriever.new
  end

  def MenuItem.all
    menu_items = MenuItemsRetriever.new
    menu_items.all
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
