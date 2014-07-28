(function() {
  var ResistanceJohn;

  ResistanceJohn = angular.module('ResistanceJohn', ['ngRoute']);

  ResistanceJohn.config([
    '$routeProvider', function($routeProvider) {
      $routeProvider.when('/message/:messageId', {
        templateUrl: '../assets/mainMessage.html',
        controller: 'MessageCtrl'
      });
      return $routeProvider.otherwise({
        templateUrl: '../assets/mainIndex.html',
        controller: 'IndexCtrl'
      });
    }
  ]);

}).call(this);
angular.module('ResistanceJohn').factory('messageData', ['$http', ($http) ->

  messageData =
    data:
      messages: [{title: 'My first post', contents: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec laoreet lobortis vulputate. Ut tempus, orci eu tempor sagittis, mauris orci ultrices arcu, in volutpat elit elit semper turpis. Maecenas id lorem quis magna lacinia tincidunt. In libero magna, pharetra in hendrerit vitae, luctus ac sem. Nulla velit augue, vestibulum a egestas et, imperdiet a lacus. Nam mi est, vulputate eu sollicitudin sed, convallis vel turpis. Cras interdum egestas turpis, ut vestibulum est placerat a. Proin quam tellus, cursus et aliquet ut, adipiscing id lacus. Aenean iaculis nulla justo.'}, {title: 'A walk down memory lane', contents: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin leo sem, imperdiet in faucibus et, feugiat ultricies tellus. Vivamus pellentesque iaculis dolor, sed pellentesque est dignissim vitae. Donec euismod purus non metus condimentum porttitor suscipit nibh tempor. Etiam malesuada elit in lectus pharetra facilisis. Fusce at nisl augue. Donec at est felis. Sed a gravida diam. Nunc nunc mi, egestas non dignissim et, porta aliquam ante.'}]

  console.log("Initialized messageData.")

  return messageData

])
;
(function() {
  this.IndexCtrl = function($scope, $location, $http, messageData) {
    var loadMessages;
    $scope.data = messageData.data;
    loadMessages = function() {
      return $http.get('./messages.json').success(function(data) {
        $scope.data.messages = data;
        return console.log('Successfully loaded messages.');
      }).error(function() {
        return console.error('Failed to load messages.');
      });
    };
    return $scope.viewMessage = function(messageId) {
      return $location.url('/message/' + messageId);
    };
  };

}).call(this);
(function() {
  this.MessageCtrl = function($scope, $routeParams, messageData) {
    $scope.data = {
      message: messageData.data.messages[0]
    };
    $scope.data.messageId = $routeParams.messageId;
    return console.log($routeParams);
  };

}).call(this);
