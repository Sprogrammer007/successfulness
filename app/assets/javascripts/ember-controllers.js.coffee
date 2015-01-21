Successfulness.ApplicationController = Ember.Controller.extend
  userName: 6,
  leftNavState: true,
  isOpen: Ember.computed.alias('leftNavState'),
  actions: {
    toggle: -> 
      if @get('leftNavState')
        @set('leftNavState', false)
      else
        @set('leftNavState', true)
  }

Successfulness.ApplicationRoute = Ember.Route.extend
  actions:
    openModal: (modalName, content) ->
      @controllerFor(modalName).set('content', content)
      @render modalName,
        into: "application"
        outlet: "modal"

    closeModal: ->
      @disconnectOutlet
        outlet: "modal"
        parentView: "application"

Successfulness.ModalController = Ember.ObjectController.extend
  content: '',
  actions:
    close: ->
      @send "closeModal"

Successfulness.ModalDialogComponent = Ember.Component.extend
  actions:
    close: ->
      @sendAction()
