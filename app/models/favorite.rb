class Favorite < ActiveRecord::Base
  attr_accessible :employee_id, :menu_item_id

  belongs_to :employee
  belongs_to :menu_item
end
