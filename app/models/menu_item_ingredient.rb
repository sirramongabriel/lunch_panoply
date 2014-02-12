class MenuItemIngredient < ActiveRecord::Base
  attr_accessible :quantity

  belongs_to :menu_item
  belongs_to :ingredient
end
