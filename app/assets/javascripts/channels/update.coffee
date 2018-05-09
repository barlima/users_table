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
        <td><a href=\"/users/#{data['id']}\">Show</a></td>
      </tr>"
    )

    $("#first_name_#{data['id']}").html(
      "<strong>First name:</strong> #{data['first_name']}"
    )

    $("#last_name_#{data['id']}").html(
      "<strong>Last name:</strong> #{data['last_name']}"
    )

    $("#email_#{data['id']}").html(
      "<strong>Email:</strong> #{data['email']}"
    )

  update: (id, first_name, last_name, email) ->
    @perform 'update', id: id, first_name: first_name, last_name: last_name, email: email
