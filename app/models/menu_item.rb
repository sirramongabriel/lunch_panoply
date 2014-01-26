
class MenuItem < ActiveRecord::Base
  attr_accessible :calories, :img1, :img2, :img3, :img4, :img5, :ingredient1, 
  								:ingredient10, :ingredient11, :ingredient12, :ingredient13, 
  								:ingredient14, :ingredient15, :ingredient16, :ingredient17, 
  								:ingredient18, :ingredient19, :ingredient2, :ingredient20, 
  								:ingredient3, :ingredient4, :ingredient5, :ingredient6, 
  								:ingredient7, :ingredient8, :ingredient9, :price, :title

  belongs_to :venue
  belongs_to :menu

  has_many :comments
  has_many :employees, through: :comments
  has_many :favorites
  has_many :employees, through: :favorites
 

  validates_presence_of :title, :price, :ingredient1, :calories

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

end
