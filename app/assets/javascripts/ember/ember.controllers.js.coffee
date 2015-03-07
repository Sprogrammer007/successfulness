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

  Successfulness.CourseController = Ember.ObjectController.extend
    names2: ["test", "test2"]
    names: [{firstName: "Yehuda", id: 1},{firstName: "Tom",    id: 2}]

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
