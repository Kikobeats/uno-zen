'use strict'

$ ->
  el = document.body
  el.dataset.page ?= Uno.context()
  el.dataset.device ?= Uno.device()
  console.log Uno.device()
  $(window).on "resize", Uno.device()
  $(window).on "orientationchange", Uno.device()

  Uno.readTime()
  FastClick.attach el unless Uno.is 'device', 'desktop'

  if Uno.is 'page', 'post'
    $('.main').readingTime readingTimeTarget: '.post.reading-time > span'

  $('#panic-button').click ->
    s = document.createElement 'script'
    s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
    document.body.appendChild s
