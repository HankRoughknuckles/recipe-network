angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/',
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
  ])
