Successfulness.ApplicationController = Ember.Controller.extend
  leftNavState: false,
  isOpen: Ember.computed.alias('leftNavState'),
  actions: {
    toggle: -> 
      if @get('leftNavState')
        @set('leftNavState', false)
      else
        @set('leftNavState', true)
  }