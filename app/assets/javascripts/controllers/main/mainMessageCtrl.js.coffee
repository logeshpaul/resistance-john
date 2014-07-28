@MessageCtrl = ($scope, $routeParams, messageData) ->

  $scope.data =
    messageData: messageData.data

  messageData.loadMessages()

  $scope.data.messageId = $routeParams.messageId

# @MessageCtrl.$inject = ['$scope', '$routeParams', 'messageData']