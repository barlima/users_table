App.destroy = App.cable.subscriptions.create "DestroyChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("##{data['id']}").remove()

  destroy: (id) ->
    @perform 'destroy', id: id
