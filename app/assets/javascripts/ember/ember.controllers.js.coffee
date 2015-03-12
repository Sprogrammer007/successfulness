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
    names: [{firstName: "Published", id: 1}, {firstName: "Private",  id: 2}]
    maxStudent: (->
      if (@get('max_student') == 0)
        return 'None'
      else
        return @get('max_student')
      ).property('max_student')

    actions:
      edit: ->
        console.log("test")
        CKEDITOR.replace( 'editor' );

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
