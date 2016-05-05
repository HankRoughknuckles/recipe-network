angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/',
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
        .when('/recipes/:id',
          templateUrl: "recipes/show.html"
          controller: "RecipesShowController"
        )
  ])
