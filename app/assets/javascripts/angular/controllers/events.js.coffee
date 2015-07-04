'use strict'

angular.module 'esche', ['ngRoute']

.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/templates/events/new.html'
      controller: 'EventsCtrl.new'
    .when '/events/new',
      templateUrl: '/templates/events/new.html'
      controller: 'EventsCtrl.new'
    .when '/events/:eventId',
      templateUrl: '/templates/events/show.html'
      controller: 'EventsCtrl.show'
#  $locationProvider.html5Mode true

.controller "EventsCtrl.new", ($scope, $http, $routeParams, $location) ->
  $scope.create = (event) ->
    $http.post "/api/events.json", event
      .success (data, status, headers, config) ->
        console.log "success : " + status
        console.log data
        $location.path "/events/" + data.event.id
      .error (data, status, headers, config) ->
        console.log "error : " + status
  
.controller 'EventsCtrl.show', ($scope, $http, $routeParams, $location) ->
  $http.get "/api/events/" + $routeParams.eventId + ".json", {}
    .success (data, status, headers, config) ->
      if data.error
        alert "error"
      else
        $scope.event = data.event
        $scope.url = $location.absUrl() + "/answers"
    .error (data, status, headers, config) ->
      console.log "error"
