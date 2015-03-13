emberRoutes = ->
  Ember.Router.map ->
    @resource 'course', { path: '/:title' }, ->
      @route('settings')
      @route('students')
      @route('feedbacks')
      
  # Successfulness.Router.reopen
  #   location: 'none'

  Successfulness.ApplicationRoute = Ember.Route.extend
    actions:
      openModal: (modalName, title, content) ->
        @controllerFor(modalName).set('content', content)
        @controllerFor(modalName).set('title', title)
        @render modalName,
          into: "application"
          outlet: "modal"

      closeModal: ->
        @disconnectOutlet
          outlet: "modal"
          parentView: "application"

      editThumb: (modalName) ->
        img = Ember.$('.course-thumb').find('img').clone()
        @controllerFor(modalName).set('content', img[0])
        @render modalName,
          into: "application"
          outlet: "modal"

  Successfulness.CourseRoute = Ember.Route.extend
    model: (params) ->
      return Successfulness.Courses.findBy('title', params.title)

    renderTemplate: ->
      @_super
      @render('course', {into: 'courses'});

  Successfulness.CourseSettingsRoute = Em.Route.extend
    model: ->
      return @modelFor('course')

    renderTemplate: (controller, model)->
      that = @
      @_super
      @loader.start(that)
      window.setTimeout (-> 
        return that.render('course.settings', {into: 'course', outlet: 'details', controller: 'course'})
      ), 500
      
$(document).ready(emberRoutes)