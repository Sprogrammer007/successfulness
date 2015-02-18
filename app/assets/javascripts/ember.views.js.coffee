emberViews = -> 
  Successfulness.ApplicationView = Ember.View.extend 
    templateName: 'application'
    didInsertElement: ->
      @_super();
      Ember.run.scheduleOnce('afterRender', this, @.afterRenderEvent)

    afterRenderEvent: ->
      $('.tse-scrollable').TrackpadScrollEmulator();
      $('#course_start_date, #course_end_date').datepicker
        changeYear      : true
        changeMonth     : true
        yearRange       : 'c:c+5'
        constrainInput  : true
        showAnim        : "fade"
        dateFormat      : "yy-mm-dd"
        showOn          : 'both'
        buttonText      : '<i class="fa fa-calendar"></i>'
$(document).ready(emberViews)