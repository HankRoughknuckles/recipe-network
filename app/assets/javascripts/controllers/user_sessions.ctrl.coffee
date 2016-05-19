angular.module('app.controllers')
  .controller('UserSessionsController', [
    '$scope'
    ($scope) ->
      $scope.$on('auth:login-error', (event, reason) ->
        $scope.error = reason.errors[0] if reason
      )
  ])
