/*global console,angular*/
(function () {
  'use strict';

  angular.module('esche')
    .controller("EventsCtrl.new", ["$scope", "$location", "eventService", function ($scope, $location, eventService) {
      $scope.event = {
        title: "",
        note: "",
        dates: []
      };
      $scope.dateFrom = new Date();
      $scope.dateTo = new Date();
      $scope.dateTo.setDate($scope.dateTo.getDate() + 7);
      $scope.create = function () {
        eventService.create($scope.event, function (data) {
          $location.path("/events/" + data.event.id);
        });
      };
      $scope.addDates = function (dateFrom, dateTo) {
        $scope.event.dates = eventService.getDates(dateFrom, dateTo);
      };
      $scope.addDates($scope.dateFrom, $scope.dateTo);
    }])
    .controller("EventsCtrl.show", ["$scope", "$routeParams", "$location", "eventService", function ($scope, $routeParams, $location, eventService) {
      $scope.mail = {
        from_address: "",
        to_addresses: ""
      };
      eventService.show($routeParams.eventId, function (data) {
        $scope.event = data.event;
        $scope.url = $location.absUrl() + "/answers";
        $scope.send_mail = function () {
          eventService.sendMail($routeParams.eventId, $scope.mail);
        };
      });
    }]);
}());
