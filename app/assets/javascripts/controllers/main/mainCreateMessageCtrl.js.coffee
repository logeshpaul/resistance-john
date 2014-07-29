@CreateMessageCtrl = ($scope, $location, messageData) ->

  $scope.data = messageData.data
  messageData.loadMessages()

  $scope.formData =
    newMessageAuthorName: ''
    newMessageContents: ''

  $scope.navNewMessage = ->
    $location.url('/message/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createMessage = ->
    messageData.createMessage($scope.formData)
    $location.url('/')

  $scope.clearMessage = ->
    $scope.formData.newMessageAuthorName = ''
    $scope.formData.newMessageContents = ''

# @CreateMessageCtrl.$inject = ['$scope', '$location', 'messageData']