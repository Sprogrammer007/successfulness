Successfulness.ApplicationController = Ember.Controller.extend
  leftNavState: true,
  isOpen: Ember.computed.alias('leftNavState'),
  actions: {
    toggle: -> 
      if @get('leftNavState')
        @set('leftNavState', false)
      else
        @set('leftNavState', true)
  }