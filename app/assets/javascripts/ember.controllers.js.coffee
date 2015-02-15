emberControllers = ->
  Successfulness.ApplicationController = Ember.Controller.extend
    leftToggleState: true
    rightToggleState: true
    isOpenLeft: Ember.computed.alias('leftToggleState')
    isOpenRight: Ember.computed.alias('rightToggleState')
    actions: {
      closeLeft: ->
        @set('leftToggleState', false)
      openLeft: ->
        @set('leftToggleState', true)   

      closeRight: ->
        @set('rightToggleState', false)
      
      openRight: ->
        @set('rightToggleState', true)
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
        
$(document).ready(emberControllers)
