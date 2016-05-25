angular.module('app', [
  'templates'
  'ngRoute'
  'ngResource'
  'ng-token-auth'
  'LocalStorageModule'
  'app.controllers'
  'app.services'
])

angular.module('app.controllers', []) # contains controllers
angular.module('app.services', []) # contains services
