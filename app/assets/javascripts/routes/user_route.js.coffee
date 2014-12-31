Successfulness.UserRoute = Em.Route.extend
  model: ->
    @store.createRecord 'user'

  actions:
    createAccount: ->
      @currentModel.save().then ->
        alert 'User created'
      , ->
        
