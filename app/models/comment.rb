class Comment < ActiveRecord::Base
  attr_accessible :content
  validates_presence_of :content, :post_id
  belongs_to :post
end
