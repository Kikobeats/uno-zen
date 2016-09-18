'use strict'

# -- Dependencies --------------------------------------------------------------

gulp        = require 'gulp'
gutil       = require 'gulp-util'
sass        = require 'gulp-sass'
concat      = require 'gulp-concat'
coffee      = require 'gulp-coffee'
header      = require 'gulp-header'
uglify      = require 'gulp-uglify'
cssnano     = require 'gulp-cssnano'
addsrc      = require 'gulp-add-src'
changed     = require 'gulp-changed'
pkg         = require './package.json'
prefix      = require 'gulp-autoprefixer'
strip       = require 'gulp-strip-css-comments'
browserSync = require 'browser-sync'
reload      = browserSync.reload

PORT =
  GHOST: 2387
  BROWSERSYNC: 3000

# -- Files ---------------------------------------------------------------------

dist =
  name       : pkg.name
  css        : 'assets/css'
  js         : 'assets/js'

src =
  sass:
    main     : 'assets/scss/' + dist.name + '.scss'
    files    : ['assets/scss/**/**']

  js         :
    common   :
      main   : ['assets/js/src/__init.coffee'
                'assets/js/src/main.coffee'
                'assets/js/src/cover.coffee']
      vendor : ['assets/vendor/fastclick/lib/fastclick.js'
                'assets/vendor/instantclick/instantclick.js'
                'assets/vendor/pace/pace.min.js'
                'assets/vendor/reading-time/build/readingTime.min.js']
    post     : ['assets/vendor/fitvids/jquery.fitvids.js'
                'assets/js/src/prism.js']

  css      :
    main   : 'assets/css/' + dist.name + '.css'
    vendor : []

banner = [ "/**"
           " * <%= pkg.name %> - <%= pkg.description %>"
           " * @version <%= pkg.version %>"
           " * @link    <%= pkg.homepage %>"
           " * @author  <%= pkg.author.name %> (<%= pkg.author.url %>)"
           " * @license <%= pkg.license %>"
           " */"
           "" ].join("\n")

# -- Tasks ---------------------------------------------------------------------

gulp.task 'js-common', ->
  gulp.src src.js.common.main
  .pipe changed dist.js
  .pipe coffee().on 'error', gutil.log
  .pipe addsrc src.js.common.vendor
  .pipe concat dist.name + '.common.js'
  .pipe uglify()
  .pipe header banner, pkg: pkg
  .pipe gulp.dest dist.js
  return

gulp.task 'js-post', ->
  gulp.src src.js.post
  .pipe changed dist.js
  .pipe concat dist.name + '.post.js'
  .pipe uglify()
  .pipe header banner, pkg: pkg
  .pipe gulp.dest dist.js
  return

gulp.task 'css', ->
  gulp.src src.css.vendor
  .pipe changed dist.css
  .pipe addsrc src.sass.main
  .pipe sass().on 'error', gutil.log
  .pipe concat '' + dist.name + '.css'
  .pipe prefix()
  .pipe strip
    all: true
  .pipe cssnano()
  .pipe header banner, pkg: pkg
  .pipe gulp.dest dist.css
  return

gulp.task 'server', ->
  browserSync.init
    proxy: "http://127.0.0.1:#{PORT.GHOST}"
    port: PORT.BROWSERSYNC
    files: ['assets/**/*.*']
  return

gulp.task 'js', ['js-common', 'js-post']
gulp.task 'build', ['css', 'js']

gulp.task 'default', ->
  gulp.start ['build', 'server']
  gulp.watch src.sass.files, ['css', reload]
  gulp.watch src.js.common.main, ['js-common', reload]
  gulp.watch src.js.post, ['js-post', reload]
