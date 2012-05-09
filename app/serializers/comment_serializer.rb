class CommentSerializer < ActiveModel::Serializer
  attributes :content, :id, :post_id
end
