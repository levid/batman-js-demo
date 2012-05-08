window.BatmanRailsDemo = class BatmanRailsDemo extends Batman.App

  @title = "CRUD Demo"

  # 0.8.0 changed to this syntax
  Batman.ViewStore.prefix = 'assets/batman/views'

  @navLinks: [
    {href: "/#!/posts/", text: "Posts"},
    {href: "/#!/logout",text: "Log out"}
  ]

  @resources 'posts', ->
    @resources 'comments'
  @root 'posts'

  @on 'run', ->
    console?.log "Running ...."
    #user = new Classifieds.User()
    #user.url = '/sessions/current'
    #user.load (err) -> throw err if err
    #@set 'currentUser', user
    #BatmanRailsDemo.preloadViews()

  @on 'ready', ->
    console?.log "BatmanRailsDemo ready for use."

  # flash is a simple object
  @flash: Batman()

  # when you set an message, it auto-expires
  @flash.accessor
    get: (key) -> @[key]
    set: (key, value) ->
      @[key] = value
      if value isnt ''
        setTimeout =>
          @set(key, '')
        , 2000
      value

  @flashSuccess: (message) -> @set 'flash.success', message
  @flashError: (message) ->  @set 'flash.error', message