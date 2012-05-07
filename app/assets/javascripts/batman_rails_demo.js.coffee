window.BatmanRailsDemo = class BatmanRailsDemo extends Batman.App
  @global yes

  @title = "CRUD Demo"

  #Batman.ViewStore::prefix = 'assets/views/'

  @navLinks =
  [
    href: "/#!/posts/"
    text: "Posts"
  ,
    href: "/#!/logout"
    text: "Log out"
  ]

  @resources 'posts'
  @root 'posts'

  @on 'run', ->
    console?.log "Running ...."
    BatmanRailsDemo.preloadViews()

  @on 'ready', ->
    console?.log "BatmanRailsDemo ready for use."

  @flash: Batman()
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
