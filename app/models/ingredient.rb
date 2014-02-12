class Ingredient < ActiveRecord::Base
  attr_accessible :name

  has_many :menu_item_ingredients
  has_many :menu_items, through: :menu_item_ingredients
end
