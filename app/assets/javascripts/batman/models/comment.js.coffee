class BatmanRailsDemo.Comment extends Batman.Model
  @resourceName: 'comment'
  @storageKey: 'comments'

  # saving everything to the Rails backend
  # gives validation errors
  @persist Batman.RailsStorage

  # fields
  @encode "content", "id", "post_id"

  # validations
  @validate "content", presence: true

  # associations
  @belongsTo 'post', { inverseOf: 'comments'}

  # indicates that rails is nesting resources, shallow!
  @urlNestsUnder 'post'

# not working, needs to pass params along
class BatmanRailsDemo.CommentPaginator extends Batman.ModelPaginator
  model: BatmanRailsDemo.Comment
  limit: 10
  totalComments: 1000

  # pass along the post_id to the paginator
  constructor: (args) ->
    @params = {post_id: args.post_id}
