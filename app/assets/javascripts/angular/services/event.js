/*global console,alert,angular*/
(function () {
  
  'use strict';

  angular.module('esche')

    .service('eventService', function ($http) {
      this.create = function (args, success) {
        $http.post("/api/events.json", args)
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
      this.show = function (eventId, success) {
        $http.get("/api/events/" + eventId + ".json", {})
          .success(function (data, status, headers, config) {
            if (data.error) {
              alert(data.error);
            } else {
              success(data);
            }
          })
          .error(function (data, status, headers, config) {
            console.log("error");
          });
      };
      this.getDates = function (inputFrom, inputTo) {
        var
          currentDate,
          toDate,
          dates = [];
        if (angular.isDefined(inputFrom) && angular.isDefined(inputTo)) {
          currentDate = new Date(inputFrom);
          toDate = new Date(inputTo);
          while (currentDate <= toDate) {
            dates[dates.length] = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate());
            currentDate.setDate(currentDate.getDate() + 1);
          }
        }
        return dates;
      };
      this.sendMail = function (eventId, args) {
        $http.post("/api/events/" + eventId + "/send_mail", args)
          .success(function () { alert("メールを送信しました。"); })
          .error(function () { alert("メールの送信に失敗しました。"); });
      };
    });

}());
