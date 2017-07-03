bowerPath = '../../bower_components/'

require.config
  paths:
    angular: bowerPath + 'angular/angular'
    angularUIRouter: bowerPath + 'angular-ui-router/release/angular-ui-router'
    jquery: bowerPath + 'jquery/dist/jquery'
    jqueryUI: bowerPath + 'jquery-ui/jquery-ui.min'
    jqueryEventDrag: '../../slickgrid/lib/jquery.event.drag-2.3.0'
    uiBootstrap: bowerPath + 'angular-bootstrap/ui-bootstrap.min'
    slickgridLib: '../../slickgrid'
    slickcore: '../../slickgrid/slick.core'
    slickgrid: '../../slickgrid/slick.grid'

  shim:
    angular:
      deps: ['jquery']
      exports: 'angular'
    angularUIRouter: ['angular']
    jqueryUI: ['jquery']
    uiBootstrap: ['angular']
    slickgrid:
      deps: ['jquery', 'jqueryEventDrag']
      exports: 'slickgrid'
    slickcore:
      deps: ['jquery', 'jqueryEventDrag']
      exports: 'slickcore'

  deps: ['bootstrap']
  urlArgs: 'time=' + (new Date()).getTime()
