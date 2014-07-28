@CreateMessageCtrl = ($scope, $location, messageData) ->

  $scope.data = messageData.data
  messageData.loadMessages()

  $scope.formData =
    newMessageTitle: ''
    newMessageContents: ''

  $scope.navNewMessage = ->
    $location.url('/message/new')

  $scope.navHome = ->
    $location.url('/')

  $scope.createMessage = ->
    messageData.createMessage($scope.formData)

  $scope.clearMessage = ->
    $scope.formData.newMessageTitle = ''
    $scope.formData.newMessageContents = ''

# @CreateMessageCtrl.$inject = ['$scope', '$location', 'messageData']