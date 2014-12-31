Successfulness.SessionRoute = Em.Route.extend
  model: ->
    return this.store.createRecord('user')
