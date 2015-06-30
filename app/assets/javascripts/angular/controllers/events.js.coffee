'use strict'

angular.module 'events', ['ngRoute']

.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/templates/events/new.html'
      controller: 'new'
    .when '/events/:eventId',
      templateUrl: '/templates/events/show.html'
      controller: 'show'
    .when '/events/new',
      templateUrl: '/templates/events/new.html'
      controller: 'new'
#  $locationProvider.html5Mode true

.controller 'show', ($scope, $http, $routeParams, $location) ->
  $http.get "/api/events/" + $routeParams.eventId + ".json", {}
    .success (data, status, headers, config) ->
      if data.error
        alert "error"
      else
        $scope.event = data.event
        $scope.url = $location.absUrl() + "/answers"
    .error (data, status, headers, config) ->
      console.log "error"

.controller 'new', ($scope, $http) ->
  $scope.create = (event) ->
    $http.post "/api/events.json", event
      .success (data, status, headers, config) ->
        console.log "success : " + status
      .error (data, status, headers, config) ->
        console.log "error : " + status
