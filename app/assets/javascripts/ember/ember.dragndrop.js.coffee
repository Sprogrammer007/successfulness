emberDragNDrop = ->

  window.DragNDrop = Ember.Namespace.create()

  DragNDrop.cancel = (e) ->
    e.preventDefault()
    return false

  DragNDrop.toJSON = (object) ->
    seen = []
    JSON.stringify object, (key, val) ->
      if typeof val == 'object'
        if seen.indexOf(val) >= 0
          return
        seen.push val
      val

  DragNDrop.currentDragEl = null

  DragNDrop.Dragable = Ember.Mixin.create
    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @afterRenderEvent)
    afterRenderEvent: ->
      Ember.$(this.element).draggable
        connectToSortable: '#ember302'
        helper: "clone",
        revert: "invalid"

    # attributeBindings: 'draggable'
    # draggable: 'true'

    # dragStart: (e) ->
    #   @set('isMoving', true)
    #   DragNDrop.currentDragEl = this
    #   e.dataTransfer.effectAllowed = 'move';
    #   dataTransfer = e.originalEvent.dataTransfer
    #   dataTransfer.setData 'text/html', this.element.innerHTML
    #   if this.type == 'course-module'
    #     DragNDrop.toggleDropZone(true)

    # dragEnd: (e) ->
    #   @set('isMoving', false)
    #   DragNDrop.toggleDropZone(false)
    # drop: (e) ->
    #   if (DragNDrop.currentDragEl.element != this.element)
    #     DragNDrop.currentDragEl.element.innerHTML = this.element.innerHTML
    #     this.element.innerHTML = e.dataTransfer.getData('text/html')

  DragNDrop.Droppable = Ember.Mixin.create
    childView: null

    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @afterRenderEvent)
    afterRenderEvent: ->
      that = this
      Ember.$(this.element).sortable
        placeholder: "placeholder"
        revert: true
        start: (e, ui) ->
        receive: ( event, ui ) ->
          recievedItem = $(this).data().uiSortable.currentItem
        activate: (e, ui) ->
          $(this).append('<li class="placeholder2"></li>')
        over: (e, ui) ->
          $(this).find('.placeholder2').remove()
        deactivate: (e, ui) ->
          $(this).find('.placeholder2').remove()
      Ember.$(this.element).droppable
        accept: '.module-box'
        hoverClass: 'droppable'
        

    # childView: null
    # dragEnter: (e) ->

    # dragLeave: ->
    #   if DragNDrop.currentDragEl.type == 'course-module'
    #     @.removeObject(@get('childViews')[@get('childViews').length - 1])
    # dragOver: DragNDrop.cancel
    # drop: (e) ->
    #   if DragNDrop.currentDragEl.type == 'course-module'
    #     currentEl = DragNDrop.currentDragEl.element
    #     @childView = Successfulness.DragableLiView.create
    #       template: Ember.Handlebars.compile(currentEl.innerHTML)
    #     @pushObject(@childView)

    #     DragNDrop.currentDragEl.destroy()
    #     DragNDrop.toggleDropZone(false)
    #     e.preventDefault()
    #     return false


$(document).ready(emberDragNDrop)