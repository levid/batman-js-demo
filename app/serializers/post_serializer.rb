class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :id
  has_many :comments
end
