angular.module('app.controllers')
  .controller 'MainController', [
    '$scope'
    '$rootScope'
    '$location'
    '$auth'
    'localStorageService'
    'Page' # used for setting the title of the page
    ($scope, $rootScope, $location, $auth, localStorageService, Page) ->
      $scope.Page = Page


      # paths and actions for links
      $scope.showRecipes = -> $location.path ROOT_PATH
      $scope.showSignIn = -> $location.path SIGN_IN_PATH
      $scope.showSignUp = -> $location.path SIGN_UP_PATH
      $scope.favoritesPage = ->
        if $scope.currentUser()
          $location.path FAVORITE_RECIPES_PATH 
        else
          $location.path SIGN_IN_PATH


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


      # signs out the logged in user and sets $scope.currentUser() to null
      $scope.signOut = -> 
        $auth.signOut()
          .then (response) ->
            $scope.setCurrentUser(null)
          .catch (response) ->
            console.log "There was an error logging out"
  ]
