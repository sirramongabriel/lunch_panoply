class Comment < ActiveRecord::Base
  attr_accessible :content, :title, :commentable_type

  belongs_to :commentable, polymorphic: true, primary_key: 'commentable_id'

  validates_presence_of :title, :content
end
