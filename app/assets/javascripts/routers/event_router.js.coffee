class ESche.Routers.Event extends Backbone.Router
  
  routes:
    '': 'new'
    'events/new': 'new'
    'events/:id': 'show'
    
  new: ->
    console.log "new"
    view = new ESche.Views.EventNew(model: new ESche.Models.Event())
    $("#main").html(view.render().el)

  show: (id) ->
    console.log "show"
    console.log id
    view = new ESche.Views.EventShow(model: new ESche.Models.Event())
