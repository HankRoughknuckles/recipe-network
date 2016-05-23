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
          ( favoritesSuccess ), ( favoritesFailure )


      $scope.favoriteRecipe = ->
        FavoriteRecipesApi.save { recipeId: $routeParams.recipeId },
          ( favoritesSuccess ), ( favoritesFailure )



      # Handler for what happens when server response is a success when
      # dealing with add/removing recipe to/from favorites. Whether adding
      # or removing from favorites, the server will return the recipe
      favoritesSuccess = (affectedResource) ->
        $scope.recipe = affectedResource


      # Handler for what happens when server response is a failure when
      # dealing with add/removing recipe to/from favorites. Whether adding
      # or removing from favorites, the server will return some response
      # object
      favoritesFailure = (httpResponse) ->
        (httpResponse) -> console.log(httpResponse) 
  ]
