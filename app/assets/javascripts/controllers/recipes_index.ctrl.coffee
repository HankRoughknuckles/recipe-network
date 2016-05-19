angular.module('app.controllers')
  .controller('RecipesIndexController', [
    '$scope'
    '$resource'
    '$location'
    'RecipesApi'
    ($scope, $resource, $location, RecipesApi) ->
      # scope variables
      $scope.recipes = []


      # load the recipes from the API
      RecipesApi.query(search: "",
        (results) -> $scope.recipes = results
      )


      $scope.showRecipe = (recipe) ->
        $location.path "recipes/#{recipe.id}"
  ])
