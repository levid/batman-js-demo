class BatmanRailsDemo.Post extends Batman.Model
  @resourceName: 'post'
  @storageKey: 'posts'
  @persist Batman.RailsStorage
  @encode "title", "content", "id"

  @validate "title", presence: true
  @validate "content", presence: true

  @hasMany 'comments'