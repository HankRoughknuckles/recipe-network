angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/recipes/:id',
          templateUrl: "recipes/show.html"
          controller: "RecipesShowController"
        )
        .otherwise(
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
  ])
