class Employee < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  validates_presence_of :first_name, :last_name

  belongs_to :company

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :emails, as: :emailable
  has_many :favorites, dependent: :destroy
  has_many :favorite_menu_items, through: :favorites, source: :menu_item

  def Employee.by_first_name
  	Employee.all.order(first_name: asc)
  end

  def Employee.by_last_name
  	Employee.all.order(last_name: :asc)
  end

  def Employee.joined_on_newest_first
  	Employee.all.order(created_at: :desc)
  end

  def Employee.joined_on_oldest_first
  	Employee.all.order(created_at: :asc)
  end

  def Employee.by_favorite
  end

	def full_name
		"#{first_name} #{last_name}"
	end  
end
