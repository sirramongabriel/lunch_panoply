class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :employee_id, :menu_item_id 

  belongs_to :employee
  belongs_to :menu_item
end
