'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _expand = (options = {}) ->
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $('.cover').removeClass 'collapsed'
    $('.cover').addClass 'animated' if options.animate
    $('.main').hide()

  _collapsed = (options = {})->
    method = if options.toggle then 'toggleClass' else 'addClass'
    $('.cover')[method] 'collapsed'
    $('.cover').addClass 'animated' if options.animate
    $('.link-item')[method] 'collapsed'
    isMainVisible = $('.main').is(":visible")
    action = if (options.toggle and isMainVisible) then 'hide' else 'show'
    Uno.search.form action
    $('.main')[action]()

  $('#blog-button').click ->
    return $("#menu-button").trigger("click") unless Uno.is 'device', 'desktop'
    _collapsed(toggle: true)

  $("#menu-button").click ->
    $('.cover').toggleClass 'collapsed'
    $('.main').toggleClass 'collapsed'
    $('#menu-button').toggleClass 'collapsed'

  if Uno.is 'device', 'desktop'
    if Uno.is 'page', 'home'
      if isOpen then _collapsed(animate: true) else _expand(animate: true)
    else
      _collapsed()
  else
    _collapsed()
