angular.module('app')
  .config(['$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/recipes/favorites',
          templateUrl: "recipes/favorite_recipes.html"
          controller: "FavoriteRecipesController"
          resolve:
            factory: authenticateUser
        )
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


authenticateUser = ($rootScope, $location) ->
  $location.path('/sign-in') unless $rootScope.currentUser()
