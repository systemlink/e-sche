class ESche.Routers.Event extends Backbone.Router
  
  routes:
    '': 'new'
    
  initialize: ->
    @model = new ESche.Models.Event()
    
  new: ->
    view = new ESche.Views.EventNew(model: @model)
    $("#main").html(view.render().el)
