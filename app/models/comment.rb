class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :commentable_type

  belongs_to :commentable, polymorphic: true

  validates_presence_of :title, :content
end
