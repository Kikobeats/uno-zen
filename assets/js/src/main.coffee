'use strict'

$ ->

  InstantClick.init()

  if Uno.is 'device', 'desktop'
    $('a').not('[href*="mailto:"]').click ->
      if this.href.indexOf(location.hostname) is -1
        window.open $(this).attr 'href'
        false
  else
    FastClick.attach Uno.app

  if Uno.is('page', 'home') or Uno.is('page', 'paged') or Uno.is('page', 'tag')
    Uno.timeAgo '#posts-list time'

  if Uno.is 'page', 'post'
    Uno.timeAgo '.post.meta > time'
    $('main').readingTime readingTimeTarget: '.post.reading-time > span'
    Uno.linkify $('#post-content').children('h1, h2, h3, h4, h5, h6')
    $('.content').fitVids()

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s

  $('#search-input').keyup (e) ->
    $('#search-form').attr('action', Uno.search.url + '+' + encodeURIComponent(e.target.value))
