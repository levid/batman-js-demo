class Post < ActiveRecord::Base
  attr_accessible :content, :title
  validates_presence_of :content, :title
  has_many :comments
end
