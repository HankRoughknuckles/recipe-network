angular.module('app.services')
  .factory('RecipesApi', [
    '$resource'
    ($resource) ->
      $resource('/recipes/:recipeId',
                { recipeId: '@id', format: 'json' },
                { update: { method: 'PUT' } })
  ])
