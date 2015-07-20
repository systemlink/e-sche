/*global angular,console*/
(function () {
  'use strict';
  
  angular.module('esche')
    .controller("AnswersCtrl.new", function ($scope, $routeParams, $location, eventService, answerService) {
      $scope.answer = {
        eventId: $routeParams.eventId,
        name: "",
        joins: []
      };
      eventService.show($routeParams.eventId, function (data) {
        angular.forEach(data.event.dates, function (date, i) {
          $scope.event = data.event;
          $scope.answer.joins.push({
            date: date,
            checked: true
          });
        });
      });
      $scope.create = function () {
        answerService.create($scope.answer, function (data) {
          $location.path("/events/" + data.answer.event_id);
        });
      };
    });
}());
