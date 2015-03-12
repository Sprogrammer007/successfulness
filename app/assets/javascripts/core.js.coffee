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