/*global window,angular*/
(function () {
  
  'use strict';

  angular.module('esche')

    .service('eventService', function ($http) {
      this.create = function (args, success) {
        $http.post("/api/events.json", args)
          .success(function (data) {
            if (data.error) {
              window.alert(data.error);
            } else {
              success(data);
            }
          })
          .error(function (data, status, headers, config) {
            window.console.log("error : " + status);
          });
      };
      this.show = function (eventId, success) {
        $http.get("/api/events/" + eventId + ".json", {})
          .success(function (data, status, headers, config) {
            if (data.error) {
              window.alert(data.error);
            } else {
              success(data);
            }
          })
          .error(function (data, status, headers, config) {
            window.console.log("error");
          });
      };
    });

}());
