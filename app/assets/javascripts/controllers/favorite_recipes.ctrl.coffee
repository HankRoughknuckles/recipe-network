angular.module('app.controllers')
  .controller 'FavoriteRecipesController', [
    '$scope'
    '$location'
    'FavoriteRecipesApi'
    ($scope, $location, FavoriteRecipesApi) ->
      # scope variables
      $scope.favoriteRecipes = []


      FavoriteRecipesApi.query(
        (results) -> $scope.favoriteRecipes = results
      )

      # TODO: extract the recipes list to a directive - will probably also
      # need to use a factory to store the paths for different routes as
      # well
      $scope.showRecipe = (recipe) ->
        $location.path "recipes/#{recipe.id}"
  ]
