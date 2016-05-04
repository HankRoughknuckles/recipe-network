angular.module('controllers')
  .controller('RecipesController', [
    '$scope'
    ($scope) ->
      $scope.recipes = [
        { name: "Cheese Bread" }
        { name: "Olive Mush" }
      ]
      console.log "recipesController loaded"
  ])

