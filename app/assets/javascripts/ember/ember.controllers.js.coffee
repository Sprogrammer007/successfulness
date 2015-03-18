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
    isPrerequisiteEmpty: Ember.computed.empty('prerequisites')
    maxStudent: (->
      if (@get('max_student') == 0)
        return 'No Limit'
      else
        return @get('max_student')
      ).property('max_student')
    borderColor: (-> 
        return 'border-left-color:#'+Math.floor(Math.random()*16777215).toString(16);
      ).property()

    actions:
      edit: ->
        if !@get('descriptionEditorOn')
          CKEDITOR.replace( 'description-placeholder',
            height: '360'
            on: {
              focus: (e) ->
                $('.cke_top').show();
                return

              blur: (e)->
                $('.cke_top').hide();
                return
            }
          ); 

          @set('descriptionEditorOn', true)
      
      addSection: ->
        sections = @get('sections')
        sections.pushObject(Successfulness.Section.create())
        console.log(sections)
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
