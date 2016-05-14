angular.module('app.controllers')
  .controller 'MainController', [
    '$scope'
    '$location'
    'Page' # used for setting the title of the page
    ($scope, $location, Page) ->
      $scope.Page = Page

      $scope.showRecipes = -> $location.path "/"
      $scope.showSignIn = -> $location.path "/sign-in"
  ]
