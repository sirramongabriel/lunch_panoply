class Employee < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  belongs_to :company

  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :emails, as: :emailable
  has_many :favorites, as: :favoritable

  def Employee.by_first_name
  	Employee.all.order(first_name: asc)
  end

  def Employee.by_last_name
  	Employee.all.order(last_name: :asc)
  end

  def Employee.by_votes
  end

  def Employee.by_email
  end

	def full_name
		"#{first_name} #{last_name}"
	end  
end
