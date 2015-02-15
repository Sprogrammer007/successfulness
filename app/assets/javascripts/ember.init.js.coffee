#= require handlebars-v2.0.0
#= require ember-1.9.1
#= require trackpad-scroll.min
#= require_self
#= require ember.views
#= require ember.components
#= require ember.controllers



ready = ->
  window.Successfulness = Ember.Application.create()


  
$(document).ready(ready)
