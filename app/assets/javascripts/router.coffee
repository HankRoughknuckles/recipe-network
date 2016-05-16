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
        .when('/sign-up', 
          templateUrl: 'user_registrations/new.html'
          controller: 'UserRegistrationsController'
        )
        .otherwise(
          templateUrl: "recipes/index.html"
          controller: "RecipesIndexController"
        )
  ])
