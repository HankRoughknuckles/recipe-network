angular.module('app.controllers')
  .controller "RecipesShowController", [
    '$scope'
    '$routeParams'
    'Page'
    'RecipesApi'
    'FavoriteRecipesApi'
    ($scope, $routeParams, Page, RecipesApi, FavoriteRecipesApi) ->
      $scope.recipe = {}

      Page.setTitle "Recipe details"

      RecipesApi.get { recipeId: $routeParams.recipeId },
        ( (receivedRecipe) -> $scope.recipe = receivedRecipe ),
        ( (httpResponse) -> $scope.recipe = {} )


      $scope.unfavoriteRecipe = ->
        FavoriteRecipesApi.delete { recipeId: $routeParams.recipeId },
          ( (removedRecipe) -> $scope.recipe = removedRecipe ),
          ( (httpResponse) -> console.log(httpResponse) )
  ]
