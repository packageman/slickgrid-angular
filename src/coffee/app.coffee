define [
  'angular'
  'angularUIRouter'
  'coreLoader'
], (angular) ->
  app = angular.module 'my-app', [
    'ui.router'
    'coreModule'
  ]

  app.config [
    '$stateProvider'
    '$urlRouterProvider'
    ($stateProvider, $urlRouterProvider) ->
      $urlRouterProvider.otherwise '/basic'

      $stateProvider.state 'basic',
        url: '/basic'
        templateUrl: 'src/partials/basic.html'
        controller: 'ctrl.basic'
        controllerAs: 'basic'
      .state 'editable',
        url: '/editable'
        templateUrl: 'src/partials/editable.html'
        controller: 'ctrl.editable'
        controllerAs: 'editable'
    ]
    .run ['$rootScope', ($rootScope) ->
      $rootScope.hello = 'Hello Byron'
      $rootScope.there = 'Hello Byron'
    ]
  app
