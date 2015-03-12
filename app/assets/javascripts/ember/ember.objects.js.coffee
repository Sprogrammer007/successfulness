emberObjects = ->

  Successfulness.Course = Ember.Object.extend({});
  Successfulness.Loader = Ember.Object.extend
    start: (route)->
      route.render('_loader', {into: 'course', outlet: 'details'})


$(document).ready(emberObjects)