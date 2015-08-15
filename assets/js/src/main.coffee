'use strict'

$ ->

  el = document.body
  el.dataset.page = Uno.context()
  el.dataset.device = Uno.device()
  $(window).on "resize", Uno.device()
  $(window).on "orientationchange", Uno.device()

  Uno.readTime()
  FastClick.attach el unless Uno.is 'device', 'desktop'

  if Uno.is 'device', 'desktop'
    $(document.links).filter ->
      @hostname != window.location.hostname
    .attr 'target', '_blank'

  if Uno.is 'page', 'post'
    $('main').readingTime readingTimeTarget: '.post.reading-time > span'
    $('.content').fitVids()

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s
