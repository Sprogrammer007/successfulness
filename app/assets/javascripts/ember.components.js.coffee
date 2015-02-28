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

  Successfulness.NewCourseComponent = Ember.Component.extend
    classNames: ['new-course']
    isClicked: (-> 
      return false
    ).property()
    click: ->
      if !@get('isClicked')
        @set('isClicked', true)
    actions: 
      testAction: (value) ->
        that = @
        if value == ''
          @set('isClicked', false)
        else
          Ember.$.post(@get('url'), {course: {title: value}}, ((data)->
            that.set('isClicked', false)
            ), 'script')  
        

  Successfulness.FocusInputComponent = Ember.TextField.extend
    becomeFocused: (->
      @$().focus()
      return
    ).on('didInsertElement')

    focusOut: ->
      this.sendAction('targetAction', this.get('value'));


$(document).ready(emberComponents)
