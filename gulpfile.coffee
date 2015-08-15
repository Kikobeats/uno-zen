'use strict'

# -- Dependencies --------------------------------------------------------------

gulp    = require 'gulp'
gutil   = require 'gulp-util'
sass    = require 'gulp-sass'
concat  = require 'gulp-concat'
coffee  = require 'gulp-coffee'
header  = require 'gulp-header'
uglify  = require 'gulp-uglify'
cssmin  = require 'gulp-cssmin'
addsrc  = require 'gulp-add-src'
changed = require 'gulp-changed'
pkg     = require './package.json'
prefix  = require 'gulp-autoprefixer'
strip   = require 'gulp-strip-css-comments'
browserSync = require 'browser-sync'
reload = browserSync.reload

PORT =
  GHOST: 2387
  BROWSERSYNC: 3000

# -- Files ---------------------------------------------------------------------

src =
  sass:
    main   : 'assets/scss/uno.scss'
    files  : ['assets/scss/**/**']
  js       :
    main   : ['assets/js/src/__init.coffee'
              'assets/js/src/main.coffee'
              'assets/js/src/cover.coffee'
              'assets/js/src/search.coffee']
    vendor : ['assets/vendor/fastclick/lib/fastclick.js'
              'assets/vendor/ghostHunter/jquery.ghostHunter.min.js'
              'assets/vendor/pace/pace.min.js'
              'assets/vendor/fitvids/jquery.fitvids.js'
              'assets/vendor/reading-time/build/readingTime.min.js']
  css      :
    main   : 'assets/css/uno.css'
    vendor : []

dist =
  css      : 'assets/css'
  js       : 'assets/js'

banner = [ "/**"
           " * <%= pkg.name %> - <%= pkg.description %>"
           " * @version v<%= pkg.version %>"
           " * @link    <%= pkg.homepage %>"
           " * @author  <%= pkg.author.name %> (<%= pkg.author.url %>)"
           " * @license <%= pkg.license %>"
           " */"
           "" ].join("\n")

# -- Tasks ---------------------------------------------------------------------

gulp.task 'css', ->
  gulp.src src.css.vendor
  .pipe changed dist.css
  .pipe addsrc src.sass.main
  .pipe sass().on "error", gutil.log
  .pipe concat 'uno.css'
  .pipe prefix()
  .pipe strip
    all: true
  .pipe cssmin()
  .pipe header banner, pkg: pkg
  .pipe gulp.dest dist.css
  return

gulp.task 'js', ->
  gulp.src src.js.main
  .pipe changed dist.js
  .pipe coffee().on "error", gutil.log
  .pipe addsrc src.js.vendor
  .pipe concat 'uno.js'
  .pipe uglify mangle: false
  .pipe header banner, pkg: pkg
  .pipe gulp.dest dist.js
  return

gulp.task 'server', ->
  browserSync.init null,
    proxy: "http://127.0.0.1:#{PORT.GHOST}"
    files: ["assets/**/*.*"]
    reloadDelay: 300
    port: PORT.BROWSERSYNC
  return

gulp.task 'build', ['css', 'js']

gulp.task "default", ->
  gulp.start ["build", "server"]
  gulp.watch src.sass.files, ["css"]
  gulp.watch src.js.main, ["js"]
  gulp.watch src.js.vendor, ["js"]
