emberControllers = ->
  Successfulness.ApplicationController = Ember.Controller.extend
    leftToggleState: true
    cropState: false
    descriptionEditorOn: false
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
        return 'No Limit'
      else
        return @get('max_student')
      ).property('max_student')

    actions:
      edit: ->
        if !@get('descriptionEditorOn')
          editor = CKEDITOR.replace( 'description-placeholder' );
          @set('descriptionEditorOn', true)
          editor.on 'focus', ->
            $('.cke_top').show();

          editor.on 'blur', (e)->
            $('.cke_top').hide();

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
