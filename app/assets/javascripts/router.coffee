angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/recipes/:recipeId',
          templateUrl: "recipes/show.html"
          controller: "RecipesShowController"
        )
        .otherwise(
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
  ])
