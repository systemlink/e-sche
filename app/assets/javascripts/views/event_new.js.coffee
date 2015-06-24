class ESche.Views.EventNew extends Backbone.View
  
  template: JST['events/new']

  events: ->
    'submit form': 'handleSubmit'

  handleSubmit: ->
    this.model.set(this.form)
    #storage.save(this.model).then(() => {
    #  history.navigate('colors', { trigger: true })
  
  render: ->
    $(@el).html(@template())
    this
  