angular.module('app.controllers')
  .controller "RecipesShowController", [
    '$scope'
    '$routeParams'
    'Page'
    'RecipesApi'
    ($scope, $routeParams, Page, RecipesApi) ->
      $scope.recipe = {}

      Page.setTitle "Recipe details"

      RecipesApi.get { recipeId: $routeParams.recipeId },
        ( (receivedRecipe) -> $scope.recipe = receivedRecipe ),
        ( (httpResponse) -> $scope.recipe = {} )
  ]
