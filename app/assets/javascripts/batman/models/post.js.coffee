class BatmanRailsDemo.Post extends Batman.Model
  @resourceName: 'post'
  @storageKey: 'posts'

  @persist Batman.RailsStorage

  # fields
  @encode "title", "content"

  # validations
  @validate "title", presence: true
  @validate "content", presence: true

  # associations
  @hasMany 'comments'