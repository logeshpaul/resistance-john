angular.module('ResistanceJohn').factory('messageData', ['$http', ($http) ->

  messageData =
    data:
      messages: [{title: 'Loading', contents: ''}]
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

  return messageData

])