angular.module('app', [
  'templates'
  'ngRoute'
  'controllers'
])


angular.module('controllers', [])
  .controller('RecipesController', [
    '$scope'
    ($scope) ->
      console.log "recipesController loaded"
  ])

