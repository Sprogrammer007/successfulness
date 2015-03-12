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

  Successfulness.CoursesView = Ember.View.extend
    elementId: 'courses'
    actions:
      success: (course)->
        @get('controller').transitionToRoute('course', course);

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

  Successfulness.CourseView = Ember.View.extend
    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @afterRenderEvent)

    afterRenderEvent: ->
      controller = @get('controller')
      $('[data-toggle="tooltip"]').addClass(@get('controller').get('status')).tooltip()

      controller.transitionToRoute('course.settings', controller.get('model'));

  Successfulness.CourseSettingsView = Ember.View.extend

    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @afterRenderEvent)

    afterRenderEvent: ->
      controller = @get('controller')
      $('#daterange').daterangepicker {
          format: 'MMM DD, YY'
          minDate: moment().format('MMM, DD, YY')
          opens: 'center'
          buttonClasses: ['btn']
          cancelClass: 'btn-danger'
          ranges: 
            '1 Day': [moment(), moment()],
            '7 Days': [moment(), moment().add(6, 'days')],
            '30 Days': [moment(), moment().add(29, 'days')]
          timePicker: true
        }, (start, end, label) ->
          controller.set('start_date', start.format('MMM, DD, YY'))
          controller.set('end_date', end.format('MMM, DD, YY'))
          return

  Successfulness.FocusInputComponent = Ember.TextField.extend
    becomeFocused: (->
      @$().focus()
      return
    ).on('didInsertElement')

    focusOut: ->
      this.sendAction('action', this.get('value'));

  # Custom Dropdownmenu select
  Successfulness.LiOption = Em.SelectOption.extend
    tagName: 'li'

    click: (e)->
      if @$().hasClass('unselectable') || @$().hasClass('active')
        return e.preventDefault()

      @$().toggleClass('active')
      @$().siblings('.active').toggleClass('active unselectable')
      @get('controller').set('status', e.target.innerHTML)

  Successfulness.DropdownMenuView = Ember.Select.extend
    classNames: ['dropdown-menu']
    tagName: 'ul'
    optionView: Successfulness.LiOption    

    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @.afterRenderEvent)

    afterRenderEvent: ->
      that = @$()
      @$().parent('.dropdown').on 'show.bs.dropdown', ->
        that.parent('[data-toggle="tooltip"]').tooltip('destroy')

      @$().parent('.dropdown').on 'hide.bs.dropdown', ->
        if that.find('.active').hasClass('unselectable')
          return false
        that.find('.active').addClass('unselectable')
        
    click: (e) ->
      

$(document).ready(emberViews)