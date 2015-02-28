emberControllers = ->
  Successfulness.ApplicationController = Ember.Controller.extend
    leftToggleState: true
    cropState: false
    cropOn: Ember.computed.alias('cropState')
    isOpenLeft: Ember.computed.alias('leftToggleState')


    actions: {
      closeLeft: ->
        @set('leftToggleState', false)
      openLeft: ->
        @set('leftToggleState', true)   
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

      editThumb: (modalName) ->
        img = Ember.$('.course-thumb').find('img').clone()
        @controllerFor(modalName).set('content', img[0])
        @render modalName,
          into: "application"
          outlet: "modal"

  Successfulness.ModalController = Ember.ObjectController.extend
    content: '',
    title: '',
    actions:
      close: ->
        @send "closeModal"  

  Successfulness.EditThumbController = Ember.ObjectController.extend
    content: '',
    actions:
      close: ->
        @send "closeModal"


        
$(document).ready(emberControllers)
