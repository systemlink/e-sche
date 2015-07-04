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
