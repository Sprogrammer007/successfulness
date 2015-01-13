Successfulness.LeftMenuComponent = Ember.Component.extend
  actions: {
    hello: ->
      console.log(@get('controler').currentLeftMenuStats)  
  }
