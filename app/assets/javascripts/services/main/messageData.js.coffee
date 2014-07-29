angular.module('ResistanceJohn').factory('messageData', ['$http', ($http) ->

  messageData =
    data:
      messages: [{author_name: 'Loading', contents: ''}]
    isLoaded: false

  messageData.loadMessages = ->
    if !messageData.isLoaded
      $http.get('./messages.json').success( (data) ->
        messageData.data.messages = data
        messageData.isLoaded = true
        console.log('Successfully loaded messages.')
      ).error( ->
        console.error('Failed to load messages.')
      )

  messageData.createMessage = (newMessage) ->
    # Client-side data validation
    if newMessage.newMessageAuthorName == '' or newMessage.newMessageContents == ''
      alert('Neither the Author name nor the Content are allowed to be left blank.')
      return false

    # Create data object to POST
    data =
      new_message:
        author_name: newMessage.newMessageAuthorName
        contents: newMessage.newMessageContents

    # Do POST request to /messages.json
    $http.post('./messages.json', data).success( (data) ->

      # Add new message to array of messages
      messageData.data.messages.push(data)
      console.log('Successfully created message.')

    ).error( ->
      console.error('Failed to create new message.')
    )

    return true

  return messageData

])