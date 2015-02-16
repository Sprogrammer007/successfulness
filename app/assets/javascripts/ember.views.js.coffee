emberViews = -> 
  Successfulness.ApplicationView = Ember.View.extend 
    templateName: 'application'
    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @.afterRenderEvent)

    afterRenderEvent: ->
      $('.tse-scrollable').TrackpadScrollEmulator()  
$(document).ready(emberViews)