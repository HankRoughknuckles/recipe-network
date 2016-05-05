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
        ( (recipe) -> $scope.recipe = recipe ),
        ( (httpResponse) -> $scope.recipe = {} )
  ]
