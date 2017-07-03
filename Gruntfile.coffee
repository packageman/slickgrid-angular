'use strict'

module.exports = (grunt) ->

  require('load-grunt-tasks') grunt
  require('time-grunt') grunt

  config =
    src: 'src'
    dist: 'dist'

  grunt.initConfig
    config: config

    copy:
      dist:
        files: [
          expand: true
          cwd: '<%= config.src %>/'
          src: '**/*.js'
          dest: '<%= config.dist %>/'
          ext: '.min.js'
          extDot: 'last'
          flatten: false
        ]

    clean:
      dist:
        src: ['<%=config.dist %>/**/*']

    coffee:
      options:
        bare: true
      buildModule:
        expand: true
        cwd: '<%= config.src %>/coffee'
        src: '**/*.coffee'
        dest: '<%= config.dist %>/js'
        ext: '.js'

    sass:
      options:
        sourcemap: 'none'
        style: 'expanded'
      buildModule:
        expand: true
        cwd: '<%= config.src %>/'
        src: 'scss/app.scss'
        dest: '<%= config.dist %>/'
        ext: '.css'

    watch:
      options:
        livereload: true
        nospawn: true
      coffeeModule:
        files: ['<%= config.src %>/coffee/**/*.coffee']
        tasks: ['coffee:buildModule']
      sassModule:
        files: ['<%= config.src %>/scss/**/*.scss']
        tasks: ['sass:buildModule']

  grunt.registerTask 'build', [
    'coffee:buildModule'
    'sass:buildModule'
  ]
