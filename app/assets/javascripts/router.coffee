angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/',
          templateUrl: "index.html"
          controller: "RecipesController"
        )
  ])
