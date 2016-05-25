angular.module('app.controllers')
  .controller 'MainController', [
    '$scope'
    '$rootScope'
    '$location'
    'Page' # used for setting the title of the page
    ($scope, $rootScope, $location, Page) ->
      $scope.Page = Page

      # paths and actions for links
      $scope.showRecipes = -> $location.path "/"
      $scope.showSignIn = -> $location.path "/sign-in"
      $scope.showSignUp = -> $location.path "/sign-up"
      $scope.favoritesPage = -> $location.path "recipes/favorites"

      # redirect to index on login
      $rootScope.$on('auth:login-success', -> $location.path('/') )


      $scope.$on('auth:login-success', (event, user) ->
        $scope.setCurrentUser(user)
        $location.path('/')
      )


      $scope.setCurrentUser = (user) ->
        localStorageService.set("user", user)

      $scope.currentUser = ->
        return localStorageService.get("user")
  ]
