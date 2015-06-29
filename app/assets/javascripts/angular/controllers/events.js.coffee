'use strict'

angular.module 'events', ['ngRoute']

.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/templates/events/index.html'
      controller: 'index'
    .when '/events',
      templateUrl: '/templates/events/index.html'
      controller: 'index'
    .when '/events/:eventId',
      templateUrl: '/templates/events/show.html'
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
