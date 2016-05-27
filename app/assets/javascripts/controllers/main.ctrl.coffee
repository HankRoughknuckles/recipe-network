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
      $scope.SIGN_IN_PATH = "#/sign-in"
      $scope.SIGN_UP_PATH = "#/sign-up"
      $scope.FAVORITE_RECIPES_PATH = "#/recipes/favorites"


      ############################################################
      # Login / logout handlers
      ############################################################
      # redirect to index on login
      $scope.$on('auth:login-success', (event, user) ->
        $rootScope.setCurrentUser(user)
        $location.path('/')
      )

      $scope.$on('auth:logout-success', (event, user) ->
        $rootScope.setCurrentUser(null)
        $location.path('/')
      )

      
      ############################################################
      # Current user getter/setter
      #   - note these are contained in the $rootScope
      ############################################################
      $rootScope.setCurrentUser = (user) ->
        localStorageService.set("user", user)

      $rootScope.currentUser = -> 
        localStorageService.get("user")
  ]
