class ESche.Views.EventShow extends Backbone.View
  
  template: JST['events/show']

  initialize: ->
    
  
  render: ->
    $(@el).html(@template(model: @model))
    this
  