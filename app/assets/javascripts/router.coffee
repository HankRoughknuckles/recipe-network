angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/recipes/:recipeId',
          templateUrl: "recipes/show.html"
          controller: "RecipesShowController"
        )
        .when('/sign-in', 
          templateUrl: 'user_sessions/new.html'
          controller: 'UserSessionsController'
        )
        .otherwise(
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
  ])
