'use strict'

angular.module 'esche', ['ngRoute', 'angular-loading-bar']

.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
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
    .when '/events/:eventId/answers',
      templateUrl: '/templates/answers/new.html'
      controller: 'AnswersCtrl.new'
]
#  $locationProvider.html5Mode true
