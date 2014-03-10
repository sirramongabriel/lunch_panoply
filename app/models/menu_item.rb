require 'net/http'
require 'uri'
require 'open-uri'
require 'menu_items_retriever'
require 'pry'


class MenuItem < ActiveRecord::Base
  # format :json
  # format :html

  attr_accessible :calories, :venue_id, :course, :description, :carbohydrates,
                  :protein, :fat, :vegetarian, :paleo, :vegan, :gluten_free,
                  :bal, :low_cal, :low_carb, :low_fat, :hi_protein, :price_cents,
                  :name, :full_image_path

  validates_presence_of :name, :calories, :price_cents
  
  belongs_to :venue

  has_many :comments
  has_many :employees, through: :comments
  has_many :favorites
  has_many :employees, through: :favorites
 
  has_many :menu_item_ingredients
  has_many :ingredients, through: :menu_item_ingredients

  has_many :images

  has_many :menu_items_retrievers

  def initialize(menu_items_retriever=MenuItemsRetriever.new)
    @menu_items_retriever = menu_items_retriever
  end

  # def MenuItem.save_from_api
  #   MenuItemsRetriever.all 
  # end

  def MenuItem.save_api_response
    @menu_items_retriever.save_api_response.each do |menu_item|
      menu = MenuItem.new(
                            name:             menu_item[:name],
                            calories:         menu_item[:calories],
                            course:           menu_item[:course],
                            description:      menu_item[:description],
                            carbohydrates:    menu_item[:carbohydrates],
                            protein:          menu_item[:protein],
                            fat:              menu_item[:fat],
                            vegetarian:       menu_item[:vegetarian],
                            paleo:            menu_item[:paleo],
                            vegan:            menu_item[:vegan],
                            gluten_free:      menu_item[:gluten_free],
                            bal:              menu_item[:bal],
                            low_cal:          menu_item[:low_cal],
                            low_carb:         menu_item[:low_carb],
                            low_fat:          menu_item[:low_fat],
                            hi_protein:       menu_item[:hi_protein],
                            price_cents:      menu_item[:price_cents],
                            full_image_path:  menu_item[:full_image_path],
                            api_dish_id:      menu_item[:api_dish_id],
                            api_venue_id:     menu_item[:api_venue_id]
                         )
      menu
    end
  end

  def all
    @menu_items_retriever.all
    # menu_items.each do |menu_item|
    #   menu_item.api_dish_id = api_call(dish)
    # end
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
