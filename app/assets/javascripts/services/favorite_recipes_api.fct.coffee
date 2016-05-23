angular.module('app.services')
  .factory('FavoriteRecipesApi', [
    '$resource'
    ($resource) ->
      $resource('/api/v1/recipes/:recipeId/favorites',
                { recipeId: '@id', format: 'json' },
                { update: { method: 'PUT' } })
  ])
