@IndexCtrl = ($scope, $location, $http, messageData) ->

  $scope.data = messageData.data

  messageData.loadMessages()

  $scope.viewMessage = (messageId) ->
    $location.url('/message/'+messageId)

  $scope.navNewMessage = ->
    $location.url('/message/new')

# @MessageCtrl.$inject = ['$scope', '$location', '$http', 'messageData']