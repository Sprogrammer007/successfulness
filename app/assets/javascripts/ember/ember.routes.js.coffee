emberRoutes = ->
  Ember.Router.map ->
    @resource('course', { path: '/:title' })

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

$(document).ready(emberRoutes)