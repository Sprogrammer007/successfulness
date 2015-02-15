emberViews = -> 
  Successfulness.ApplicationView = Ember.View.extend 
    templateName: 'application'
  
$(document).ready(emberViews)