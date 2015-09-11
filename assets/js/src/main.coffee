'use strict'

$ ->

  el = document.body
  el.dataset.page = Uno.context()
  el.dataset.device = Uno.device()

  Uno.readTime()
  FastClick.attach el unless Uno.is 'device', 'desktop'

  $('#profile-title').text window.profile_title if window.profile_title
  $('#profile-resume').text window.profile_resume if window.profile_resume

  if Uno.is 'device', 'desktop'
    $('a').not('[href*="mailto:"]').click ->
      if this.href.indexOf(location.hostname) is -1
        window.open $(this).attr 'href'
        false

  if Uno.is 'page', 'post'
    $('main').readingTime readingTimeTarget: '.post.reading-time > span'
    $('.content').fitVids()

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s
