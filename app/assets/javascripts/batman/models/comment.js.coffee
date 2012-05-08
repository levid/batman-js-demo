class BatmanRailsDemo.Comment extends Batman.Model
  @resourceName: 'comment'
  @storageKey: 'comments'
  @persist Batman.RailsStorage
  @encode "content", "id"

  @validate "content", presence: true

  @belongsTo 'post', { inverseOf: 'comments'}
  @urlNestsUnder 'post'
