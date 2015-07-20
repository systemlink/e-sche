/*global angular,console,alert*/
(function () {
  'use strict';
  
  angular.module('esche')
  
    .service('answerService', function ($http) {
      this.create = function (args, success) {
        var dates = [];
        angular.forEach(args.joins, function (join, i) {
          if (join.checked) {
            dates.push(join.date);
          }
        });
        $http.post("/api/events/" + args.eventId + "/answers", {
          event_id: args.eventId,
          name: args.name,
          dates: dates
        })
          .success(function (data) {
            if (data.error) {
              alert(data.error);
            } else {
              success(data);
            }
          })
          .error(function (data, status, headers, config) {
            console.log("error : " + status);
          });
      };
    });
}());
