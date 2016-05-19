angular.module('app.services')
  .factory('RecipesApi', [
    '$resource'
    ($resource) ->
      $resource('/api/v1/recipes/:recipeId',
                { recipeId: '@id', format: 'json' },
                { update: { method: 'PUT' } })
  ])
