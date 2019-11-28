jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: messages.data('room_id') },

    received: (data) ->
      show_user = $('#show_user').data('show_user')
      console.log data['chat_user']
      console.log show_user
      if data['chat_user'] == show_user
        $('#messages').append data['message_right']
      else
        $('#messages').append data['message_left']

    speak: (message) ->
      @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13
      App.room.speak event.target.value
      event.target.value = ''
      event.preventDefault()
