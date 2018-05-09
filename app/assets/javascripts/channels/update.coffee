App.update = App.cable.subscriptions.create "UpdateChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("##{data['id']}").replaceWith(
      "<tr id=#{data['id']}>
        <td>#{data['last_name']}</td>
        <td>#{data['first_name']}</td>
        <td>#{data['email']}</td>
      </tr>"
    )

  update: (id, first_name, last_name, email) ->
    @perform 'update', id: id, first_name: first_name, last_name: last_name, email: email
