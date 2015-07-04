/*global console,angular*/
(function () {
  'use strict';

  angular.module('esche')
    .controller("EventsCtrl.new", function ($scope, $location, eventService) {
      $scope.dateFrom = new Date();
      $scope.dateTo = new Date();
      $scope.create = function (event) {
        eventService.create(event, function (data) {
          $location.path("/events/" + data.event.id);
        });
      };
      $scope.addDates = function (dateFrom, dateTo) {
        $scope.dates = eventService.getDates(dateFrom, dateTo);
      };
    })
    .controller("EventsCtrl.show", function ($scope, $routeParams, $location, eventService) {
      eventService.show($routeParams.eventId, function (data) {
        $scope.event = data.event;
        $scope.url = $location.absUrl() + "/answers";
      });
    });
}());
