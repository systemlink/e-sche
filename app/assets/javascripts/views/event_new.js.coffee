class ESche.Views.EventNew extends Backbone.View
  
  template: JST['events/new']
  
  bindings:
    "#title": "title"
    "#note": "note"

  events: ->
    'submit form': 'handleSubmit'

  handleSubmit: (e) ->
    e.preventDefault()
    @model.save()
  
  render: ->
    $(@el).html(@template())
    this.stickit()
    this
  