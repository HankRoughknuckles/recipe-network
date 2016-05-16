angular.module('app.controllers')
  .controller 'UserRegistrationsController', [
    '$scope'
    '$auth'
    ($scope, $auth) ->
      $scope.handleRegisterButtonClick = ->
        $auth.submitRegistration($scope.registrationForm)
          .then ->
            $auth.submitLogin
              email: $scope.registrationForm.email
              password: $scope.registrationForm.password
  ]
