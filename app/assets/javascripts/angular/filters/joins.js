/*global angular*/
(function () {
  'use strict';
  
  angular.module('esche')
    .filter('joins', function () {
      return function (values, name) {
        var ret = "";
        angular.forEach(values, function (value) {
          if (ret !== "") {
            ret += ",";
          }
          ret += value[name];
        });
        return ret;
      };
    });
}());
