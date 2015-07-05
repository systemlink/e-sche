/*global console,angular*/
(function () {
  'use strict';

  angular.module('esche')
    .controller("EventsCtrl.new", function ($scope, $location, eventService) {
      $scope.event = {
        title: "",
        note: "",
        dates: []
      };
      $scope.dateFrom = new Date();
      $scope.dateTo = new Date();
      $scope.dateTo.setDate($scope.dateTo.getDate() + 7);
      $scope.create = function (event) {
        eventService.create(event, function (data) {
          $location.path("/events/" + data.event.id);
        });
      };
      $scope.addDates = function (dateFrom, dateTo) {
        $scope.event.dates = eventService.getDates(dateFrom, dateTo);
      };
      $scope.addDates($scope.dateFrom, $scope.dateTo);
      $scope.dateChange = function (index) {
        $scope.event.dates.splice(index, 1);
      };
    })
    .controller("EventsCtrl.show", function ($scope, $routeParams, $location, eventService) {
      eventService.show($routeParams.eventId, function (data) {
        $scope.event = data.event;
        $scope.url = $location.absUrl() + "/answers";
      });
    });
}());
