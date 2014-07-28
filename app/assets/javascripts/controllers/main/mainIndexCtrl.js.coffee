@IndexCtrl = ($scope, $location, $http, messageData) ->

  $scope.data = messageData.data

  messageData.loadMessages()

  $scope.viewMessage = (messageId) ->
    $location.url('/message/'+messageId)

# @MessageCtrl.$inject = ['$scope', '$location', '$http', 'messageData']