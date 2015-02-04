Successfulness.ApplicationController = Ember.Controller.extend
  leftNavState: true,
  isOpen: Ember.computed.alias('leftNavState'),
  actions: {
    close: ->
      @set('leftNavState', false)
    
    open: ->
      @set('leftNavState', true)
  }

Successfulness.ApplicationRoute = Ember.Route.extend
  actions:
    openModal: (modalName, title, content) ->
      @controllerFor(modalName).set('content', content)
      @controllerFor(modalName).set('title', title)
      @render modalName,
        into: "application"
        outlet: "modal"

    closeModal: ->
      @disconnectOutlet
        outlet: "modal"
        parentView: "application"

Successfulness.ModalController = Ember.ObjectController.extend
  content: '',
  title: '',
  actions:
    close: ->
      @send "closeModal"

Successfulness.ModalDialogComponent = Ember.Component.extend
  actions:
    close: ->
      @sendAction()
