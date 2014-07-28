@MessageCtrl = ($scope, $routeParams, messageData) ->

  $scope.data =
    message: messageData.data.messages[0]

  messageData.loadMessages()

  $scope.data.messageId = $routeParams.messageId

# @MessageCtrl.$inject = ['$scope', '$routeParams', 'messageData']