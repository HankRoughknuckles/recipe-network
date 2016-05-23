angular.module('app.services')
  .factory('FavoriteRecipesApi', [
    '$resource'
    ($resource) ->

      # Note: 
      #   FavoriteRecipesApi.save adds the recipe to the current
      #     user's favorites 
      #   FavoriteRecipesApi.delete removes it from the user's favorites
      $resource('/api/v1/recipes/:recipeId/favorites',
                { recipeId: '@recipeId', format: 'json' }, {})
  ])
