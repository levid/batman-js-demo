class BatmanRailsDemo.CommentsController extends Batman.Controller
  routingKey: 'comments'

  show: (params) ->
    # Started GET "/comments/4fa2a42e37b37e335e00000d.json"
    BatmanRailsDemo.Comment.find params.id, (err,result)  =>
      throw err if err
      @set 'comment', result

  new: (params) ->
    @set 'comment', new BatmanRailsDemo.Comment(post_id: params.postId)
    @form = @render()

  create: (params) ->
    @new_comment = @get('comment')
    @new_comment.save (err,record) =>
      $('#new_comment').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
        #@set 'comment', record
      else
        BatmanRailsDemo.flashSuccess "Comment created successfully!"
        @redirect '/posts/' + @new_comment.get('post_id')

  destroy: (params) ->

