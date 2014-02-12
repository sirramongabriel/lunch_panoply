class Image < ActiveRecord::Base
  attr_accessible :name, :url

  belongs_to :menu_item
end
