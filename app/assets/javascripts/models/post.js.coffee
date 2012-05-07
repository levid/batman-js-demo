class BatmanRailsDemo.Post extends Batman.Model
  @storageKey: 'posts'
  @persist Batman.RailsStorage
  @encode "title", "content"

  @validate "title", presence: true
  @validate "content", presence: true