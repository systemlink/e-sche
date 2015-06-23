class ESche.Views.Event extends Backbone.View
  
  template: JST['events/new']
  className: 'colors colors--create container'

  events: ->
    'submit form': 'handleSubmit'

  handleSubmit: ->
    this.model.set(this.form)
    #storage.save(this.model).then(() => {
    #  history.navigate('colors', { trigger: true })
  