Successfulness.LeftMenuComponent = Ember.Component.extend
  actions: 
    toggle: ->
      if (@get('isOpen')) 
        @sendAction('close')
      else
        @sendAction('open')

Successfulness.LeftToggleButtonComponent = Ember.Component.extend
  click: ->
    @sendAction()
    