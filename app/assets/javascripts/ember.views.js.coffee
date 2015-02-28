emberViews = -> 

  # Drag and Drop Views
  Successfulness.CourseModuleView = Ember.View.extend DragNDrop.Dragable,
    attributeBindings: ['type'],
    type: 'course-module'
    tagName: 'li'

  Successfulness.DropZoneView = Ember.ContainerView.extend DragNDrop.Droppable,
    tagName: 'ul'

  Successfulness.DragableLiView = Ember.View.extend DragNDrop.Dragable,
    classNameBindings: ['isMoving'],
    isMoving: false
    tagName: 'li'

  Successfulness.ApplicationView = Ember.View.extend 
    templateName: 'application'
    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @.afterRenderEvent)

    afterRenderEvent: ->
      $('.tse-scrollable').TrackpadScrollEmulator();
      $('#start_date, #end_date').datepicker
        changeYear      : true
        changeMonth     : true
        yearRange       : 'c:c+5'
        constrainInput  : true
        showAnim        : "fade"
        dateFormat      : "yy-mm-dd"
        showOn          : 'both'
        buttonText      : '<i class="fa fa-calendar"></i>'


  Successfulness.ThumbView = Ember.TextField.extend
    type: 'file'
    attributeBindings: ['name']
 
    change: (e) ->
      that = this
      if e.target.files and e.target.files[0]
        reader = new FileReader

        reader.onload = (e) ->
          Ember.$('.course-thumb').find('img').attr 'src', e.target.result
          return

        reader.readAsDataURL e.target.files[0]

  Successfulness.EditThumbView = Ember.View.extend
    didInsertElement: ->
      Ember.$('.edit-thumb').find('img').Jcrop
        minSize:     [200, 320]
        maxSize:     [200, 320]
        setSelect:   [ 0, 0, 200, 320]  

$(document).ready(emberViews)