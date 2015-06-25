window.ESche =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new ESche.Routers.Event
    Backbone.history.start()

$(document).ready ->
  ESche.initialize()
