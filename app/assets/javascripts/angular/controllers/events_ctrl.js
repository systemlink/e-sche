/*global window,angular*/
(function () {
  'use strict';

  angular.module('esche')
    .controller("EventsCtrl.new", function ($scope, $location, eventService) {
      $scope.create = function (event) {
        eventService.create(event, function (data) {
          $location.path("/events/" + data.event.id);
        });
      };
    })
    .controller("EventsCtrl.show", function ($scope, $routeParams, $location, eventService) {
      eventService.show($routeParams.eventId, function (data) {
        $scope.event = data.event;
        $scope.url = $location.absUrl() + "/answers";
      });
    });
}());
