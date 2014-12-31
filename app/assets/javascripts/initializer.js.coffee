Ember.Application.initializer
  name: "currentUser"
  initialize: (container, app) ->
    attr = undefined
    controller = undefined
    store = undefined
    user = undefined
    store = container.lookup("store:main")
    attr = $("meta[name=\"current-user\"]").attr("content")
    if attr
      user = store.push("user", store.serializerFor(Sarong.User).normalize(Sarong.User, JSON.parse(attr)))
      controller = container.lookup("controller:currentUser").set("content", user)
    return