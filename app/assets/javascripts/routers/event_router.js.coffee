class ESche.Routers.Event extends Backbone.Router
  
  routes:
    '': 'new'
    
  initialize: ->
    @event = new ESche.Models.Event()
    console.log @event