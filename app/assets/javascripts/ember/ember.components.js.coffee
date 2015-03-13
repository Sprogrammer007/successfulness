emberComponents = ->
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

  Successfulness.ModalDialogComponent = Ember.Component.extend
    actions:
      close: ->
        @sendAction()

  Successfulness.EditableDivComponent = Ember.Component.extend
    tagName: "div"
    classNames: ['editable-area']
    attributeBindings: ['name', 'contenteditable']
    name: Ember.computed.alias('id')
    contenteditable: true
    
    didInsertElement: ->
      CKEDITOR.inline( @get('id'),
        on: {
          blur: (event) ->
            content = event.editor.getData()
            #TODO Ajax content
        }
      );  

  Successfulness.EditableHeaderComponent = Ember.Component.extend
    classNames: ['editable-area']
    attributeBindings: ['name', 'contenteditable']
    name: Ember.computed.alias('id')
    contenteditable: true

    didInsertElement: ->
      CKEDITOR.inline( @get('id'),
        on: {
          blur: (event) ->
            content = event.editor.getData()
            #TODO Ajax content.getData()
        }
      );


  Successfulness.CkTextareaComponent = Ember.Component.extend
    didInsertElement: ->
      CKEDITOR.replace( @get('id'),
        height: @get('height')
        on: {
          blur: (event) ->
            content = event.editor.getData()
            #TODO Ajax content.getData()
        }
      );

  # New Course Component
  Successfulness.CourseTitleComponent = Ember.Component.extend
    isClicked: (-> 
      return false
    ).property()
    
    click: ->
      if !@get('isClicked')
        @set('isClicked', true)

    actions: 
      add: (value) ->
        that = @
        if value == ''
          @set('isClicked', false)
        else
          Ember.$.post(@get('url'), {course: {title: value}}, @newCourse(that), 'json')  
  
    newCourse: (that) ->
      return (json) ->
        course = Em.Object.create(json)
        Successfulness.Courses.addObject(course);
        that.set('isClicked', false);
        that.get('parentView').send('success', course)

  Successfulness.CourseListComponent = Ember.Component.extend
    tagName: 'ul'
    classNames: ['course-list']
    theCourses: ( ->
      Successfulness.Courses = JSON.parse(this.get('courses').replace(/&quot;/g,'"'))
      return Successfulness.Courses 
    ).property()

  # Icon Component with Tooltip
  Successfulness.IconTooltipComponent = Ember.Component.extend
    tagName: 'i'
    attributeBindings: ['data-placement', 'data-toggle=', 'title']
    'data-toggle': 'tooltip'
    classNames: ['fa']

    didInsertElement: ->
      @$().tooltip()

$(document).ready(emberComponents)
