module.exports = (grunt) ->
  require('load-grunt-tasks') grunt
  require('time-grunt') grunt
  grunt.initConfig

    # =============
    # SETUP
    # =============

    pkg : grunt.file.readJSON './package.json'
    meta: banner = [
      "/**"
      " * <%= pkg.name %> - <%= pkg.description %>"
      " * @version  v<%= pkg.version %>"
      " * @homepage <%= pkg.homepage %>"
      " * @author   <%= pkg.author.name %> (<%= pkg.author.url %>)"
      " * @license  <%= pkg.license %>"
      " */"].join("\n")

    src:
      sass:
        main   : 'assets/scss/uno.scss'
        files  : ['assets/scss/**/*.scss']
      js       :
        main   : ['assets/js/src/__init.coffee'
                  'assets/js/src/cover.coffee'
                  'assets/js/src/search.coffee'
                  'assets/js/src/post.coffee']
        vendor : ['assets/vendor/ghostHunter/jquery.ghostHunter.min.js'
                  'assets/vendor/pace/pace.min.js'
                  'assets/vendor/reading-time/build/readingTime.min.js']
      css      :
        main   : 'assets/css/uno.css'
        vendor : ['assets/vendor/animate.css/animate.min.css']

    dist       :
      css      : 'assets/css/uno.css'
      js       : 'assets/js/uno.js'

    # =============
    # TASKS
    # =============

    coffee     :
      main     : files: '<%=dist.js%>' : '<%=src.js.main%>'

    sass       :
      main     : files: '<%=dist.css%>' : '<%=src.sass.main%>'

    concat     :
      options  : stripBanners: true
      css      : src: ['<%=src.css.main%>', '<%=src.css.vendor%>'], dest: '<%=dist.css%>'
      js       : src: ['<%=dist.js%>', '<%=src.js.vendor%>'], dest: '<%=dist.js%>'

    autoprefixer :
      main       : files: '<%=dist.css%>' : '<%=src.css.main%>'

    cssmin     :
      options  : banner: '<%=meta.banner%>', report: 'gzip'
      main     : files: '<%=dist.css%>': '<%=dist.css%>'

    uglify        :
      options     : compress: false, banner: '<%=meta.banner%>', report: 'gzip', preserveComments: false
      main: files : '<%=dist.js%>': '<%=dist.js%>'

    clean       :
      cache     : ['.sass-cache', 'assets/scss/.sass-cache']
      npm       : ['node_modules']

    watch       :
      sass      :
        files   : ['<%=src.sass.files%>']
        tasks   : ['css']
        options : livereload: true
      js        :
        files   : ['<%=src.js.main%>']
        tasks   : ['js']
        options : livereload: true

  # =============
  # REGISTER
  # =============

  grunt.registerTask 'css', ['sass', 'concat:css', 'autoprefixer', 'cssmin']
  grunt.registerTask 'js', ['coffee', 'concat:js','uglify']
  grunt.registerTask 'production', ['css', 'js']
  grunt.registerTask 'default', ['css', 'js','watch']
