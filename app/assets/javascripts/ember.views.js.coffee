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

  Successfulness.FileUpView = Ember.TextField.extend
    type: 'file'
    change: (e) ->
      loadImage e.target.files[0], ((img) ->
        Ember.$('.course-thumb').find('img').hide()
        Ember.$('.course-thumb').prepend(img)
        return
      ),
      sourceHeight: 320
      sourceWidth: 200
      contain: true


$(document).ready(emberViews)