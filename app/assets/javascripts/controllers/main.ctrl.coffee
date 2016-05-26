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

      # paths
      $scope.ROOT_PATH = "/"
      $scope.SIGN_IN_PATH = "sign-in"
      $scope.SIGN_UP_PATH = "sign-up"
      $scope.FAVORITE_RECIPES_PATH = "recipes/favorites"


      # for opening the favorites page 
      # TODO: take care of this in the angular router
      $scope.favoritesPage = ->
        if $scope.currentUser()
          $location.path $scope.FAVORITE_RECIPES_PATH
        else
          $location.path $scope.SIGN_IN_PATH


      # redirect to index on login
      $scope.$on('auth:login-success', (event, user) ->
        $scope.setCurrentUser(user)
        $location.path('/')
      )

      
      ############################################################
      # Current user getter/setter
      ############################################################
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
