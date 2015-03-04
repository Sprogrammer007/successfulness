emberControllers = ->
  Successfulness.ApplicationController = Ember.Controller.extend
    leftToggleState: true
    cropState: false
    cropOn: Ember.computed.alias('cropState')
    isOpenLeft: Ember.computed.alias('leftToggleState')
  
    actions: 
      closeLeft: ->
        @set('leftToggleState', false)
      openLeft: ->
        @set('leftToggleState', true) 


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
