class BatmanRailsDemo.PostsController extends Batman.Controller
  routingKey: 'posts'

  index: (params) ->
    @set 'paginator', new BatmanRailsDemo.PostPaginator()
    @set 'currentPosition', 1
    @_updatePagination()

  nextPage: ->
    @set('currentPosition', @get('currentPosition') + 10)
    @_updatePagination()

  previousPage: ->
    @set('currentPosition', @get('currentPosition') - 10)
    @_updatePagination()


  show: (params) ->
    @set 'post', BatmanRailsDemo.Post.find parseInt(params.id, 10), (err) ->
      throw err if err

    @render source: 'posts/show'

  new: (params) ->
    @set 'post', new BatmanRailsDemo.Post()
    @form = @render()

  create: (params) ->
    @get('post').save (err) =>
      $('#new_post').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        BatmanRailsDemo.flashSuccess "#{@get('post.title')} created successfully!"
        @redirect '/posts'

  edit: (params) ->
    @set 'post', BatmanRailsDemo.Post.find parseInt(params.id, 10), (err) ->
      throw err if err
    @form = @render()

  update: (params) ->
    @get('post').save (err) =>
      $('#edit_post').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        BatmanRailsDemo.flashSuccess "#{@get('post.title')} updated successfully!"
        @redirect '/posts'

  # not routable, an event
  destroy: ->
    @get('post').destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        BatmanRailsDemo.flashSuccess "Removed successfully!"
        @redirect '/posts'

  _updatePagination: ->
    @resultant = @get('paginator').loadItemsForOffsetAndLimit(@get('currentPosition')-1,10)
    @resultant.observe 'response.total_count', (newValue,oldValue) =>
      @set 'totalCount', newValue

    @get('paginator').observe 'cache.items', (newValue,oldValue) =>
      @set 'posts', newValue
      @set('endingPosition',@get('currentPosition') + newValue.length - 1)


