angular.module('app.controllers')
  .controller "RecipesShowController", [
    '$scope',
    'Page'
    ($scope, Page) ->
      Page.setTitle "Recipe details"
  ]
