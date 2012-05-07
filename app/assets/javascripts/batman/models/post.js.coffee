class BatmanRailsDemo.Post extends Batman.Model
  @resourceName: 'post'
  @storageKey: 'posts'
  @persist Batman.RailsStorage
  @encode "title", "content"

  @validate "title", presence: true
  @validate "content", presence: true