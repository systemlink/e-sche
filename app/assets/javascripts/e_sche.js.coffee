'use strict'

angular.module 'events', ['ngRoute']

.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/templates/index.html'
      controller: 'index'
    .when '/:eventId',
      templateUrl: '/templates/show.html'
      controller: 'show'
#  $locationProvider.html5Mode true

.controller 'index', () ->
  console.log "index"

.controller 'show', ($scope, $http, $routeParams) ->
  $http.get "/api/events/" + $routeParams.eventId + ".json", {}
    .success (data, status, headers, config) ->
      if data.error
        alert "error"
      else
        $scope.event = data.event
    .error (data, status, headers, config) ->
      console.log "error"
