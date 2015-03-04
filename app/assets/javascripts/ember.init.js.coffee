#= require ember/handlebars-v2.0.0
#= require ember/ember-1.9.1
#= require trackpad-scroll.min
#= require_self
#= require ember/ember.dragndrop
#= require ember/ember.objects
#= require ember/ember.routes
#= require ember/ember.controllers
#= require ember/ember.views
#= require ember/ember.components


ready = ->
  window.Successfulness = Ember.Application.create()
  
$(document).ready(ready)
