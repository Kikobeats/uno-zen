module.exports = (grunt) ->
  require('load-grunt-tasks') grunt
  require('time-grunt') grunt
  grunt.initConfig

    # =============
    # SETUP
    # =============
    pkg         : grunt.file.readJSON './package.json'

    meta:
      banner    : '/* <%= pkg.name %> v<%= pkg.version %>\n' +
                '   <%= pkg.homepage %>' +
                '   Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>' +
                ' - Licensed <%= pkg.license %> */\n'
    src:
      sass:
        main   : 'assets/scss/uno.scss'
        files  : ['assets/scss/**/*.scss']
      js       :
        main   : ['assets/js/index.js',
                  'assets/js/ghostHunter.js',
                  'assets/vendor/js/jquery.ghostHunter.min.js']
      css      :
        main   : 'assets/css/uno.css'
        vendor : ['assets/vendor/css/**/*.css']

    # =============
    # TASKS
    # =============
    sass:
      main        : files: '<%=src.css.main%>' : '<%=src.sass.main%>'

    concat:
      options : stripBanners: true
      css      : src: ['<%=src.css.main%>', '<%= src.css.vendor %>'], dest: 'assets/css/uno.css'
      js       : src: ['<%=src.js.main%>'], dest: 'assets/js/uno.js'

    autoprefixer:
      main        : files: '<%=src.css.main%>' : '<%=src.css.main%>'

    cssmin:
      options     : banner: '<%=meta.banner%>', report: 'gzip'
      main        : files: 'assets/css/uno.min.css': '<%=src.css.main%>'

    uglify:
      options     : compress: false, banner: '<%=meta.banner%>', report: 'gzip', preserveComments: false
      main: files : 'assets/js/uno.min.js': '<%=src.js.main%>'

    clean:
      cache:
        ['.sass-cache', 'assets/scss/.sass-cache']
      npm:
        ['node_modules']

    watch:
      sass:
        files   : ['<%=src.sass.files%>']
        tasks   : ['css']
        options : livereload: true
      js:
        files   : ['<%=src.js.main%>']
        tasks   : ['js']
        options : livereload: true

  # =============
  # REGISTER
  # =============
  grunt.registerTask 'css', ['sass', 'concat:css', 'autoprefixer', 'cssmin']
  grunt.registerTask 'js', ['concat:js','uglify']
  grunt.registerTask 'production', ['css', 'js']
  grunt.registerTask 'default', ['css', 'js','watch']
