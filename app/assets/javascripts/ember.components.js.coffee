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

  Successfulness.RightMenuComponent = Ember.Component.extend
    actions: 
      toggle: ->
        if (@get('isOpen')) 
          @sendAction('close')
        else
          @sendAction('open')

  Successfulness.RightToggleButtonComponent = Ember.Component.extend
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

$(document).ready(emberComponents)
