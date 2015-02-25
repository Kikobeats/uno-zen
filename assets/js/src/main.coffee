'use strict'

$ ->
  el = document.body
  el.dataset.page ?= Uno.context()
  Uno.readTime()
  FastClick.attach el unless Uno.is 'device', 'desktop'

  if Uno.is 'page', 'post'
    $('.main').readingTime readingTimeTarget: '.post.reading-time > span'

  $('#panic-button').click ->
    s = document.createElement 'script'
    s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
    document.body.appendChild s
