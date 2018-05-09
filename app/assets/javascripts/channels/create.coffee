App.create = App.cable.subscriptions.create "CreateChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#users').append(
      "<tr id=#{data['id']}>
        <td>#{data['first_name']}</td>
        <td>#{data['last_name']}</td>
        <td>#{data['email']}</td>
        <td><a href=\"/users/#{data['id']}\">Show</a></td>
      </tr>"
    )

  create: (first_name, last_name, email) ->
    @perform 'create', first_name: first_name, last_name: last_name, email: email
