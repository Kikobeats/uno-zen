'use strict'

$ ->

  $('#profile-title').text window.profile_title if window.profile_title
  $('#profile-resume').text window.profile_resume if window.profile_resume

  el = Uno.app
  el.dataset.page = Uno.context()
  el.dataset.device = Uno.device()

  if Uno.is 'device', 'desktop'
    $('a').not('[href*="mailto:"]').click ->
      if this.href.indexOf(location.hostname) is -1
        window.open $(this).attr 'href'
        false
  else
    FastClick.attach el

  if Uno.is 'page', 'home'
    Uno.timeAgo '#posts-list time'

  if Uno.is 'page', 'post'
    Uno.timeAgo '.post.meta > time'
    $('main').readingTime readingTimeTarget: '.post.reading-time > span'
    $('.content').fitVids()

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s
