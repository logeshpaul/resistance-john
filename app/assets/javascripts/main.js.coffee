# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./controllers/main
#= require_tree ./directives/main
#= require_tree ./filters/main
#= require_tree ./services/main

# Creates new Angular module called 'ResistanceJohn'
ResistanceJohn = angular.module('ResistanceJohn', ['ngRoute'])

# Sets up routing
ResistanceJohn.config(['$routeProvider', ($routeProvider) ->
  # Route for '/message'
  $routeProvider.when('/message/:messageId', { templateUrl: '../assets/mainMessage.html', controller: 'MessageCtrl' } )

  # Default
  $routeProvider.otherwise({ templateUrl: '../assets/mainIndex.html', controller: 'IndexCtrl' } )

])
