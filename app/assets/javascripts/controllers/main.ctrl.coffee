angular.module('app.controllers')
  .controller 'MainController', [
    '$scope'
    'Page' # used for setting the title of the page
    ($scope, Page) ->
      $scope.Page = Page
  ]
