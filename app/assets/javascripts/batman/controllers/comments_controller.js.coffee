class BatmanRailsDemo.CommentsController extends Batman.Controller
  routingKey: 'comments'

  new: (params) ->
    @set 'comment', new BatmanRailsDemo.Comment(post_id: params.postId)
    @form = @render()

  create: (params) ->
    @new_comment = @get('comment')
    @new_comment.save (err) =>
      $('#new_comment').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        BatmanRailsDemo.flashSuccess "Comment created successfully!"
        @redirect '/posts/' + @new_comment.get('post_id')

  destroy: (params) ->

