#= require jquery
#= require jquery_ujs
#= require jquery-ui/effect-fade
#= require bootstrap
#= require ckeditor/init
#= require ckeditor/config
#= require_self


# Helpers
(($) ->
  $.fn.changeElementType = (newType) ->
    attrs = {}
    $.each @[0].attributes, (idx, attr) ->
      attrs[attr.nodeName] = attr.nodeValue
      return
    @replaceWith ->
      $('<' + newType + '/>', attrs).append $(this).contents()
    return

  return
) jQuery