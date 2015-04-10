'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _expand = ->
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $('.cover').removeClass 'collapsed'
    $('.main').hide()

  _collapsed = ->
    $('.cover').addClass 'collapsed'
    $('.link-item').addClass 'collapsed'
    Uno.search.form 'show'
    $('.main').show()

  $('#blog-button').click ->
    return $("#cover-button").trigger("click") unless Uno.is 'device', 'desktop'
    $('.cover').toggleClass 'collapsed'
    Uno.search.form 'toggle'
    $('.link-item').toggleClass 'collapsed'
    toggle = if $('.main').is(":visible") then 'hide' else 'show'
    $('.main')[toggle]()

  $("#cover-button").click ->
    $('.cover').toggleClass 'collapsed'
    $('.main').toggleClass 'collapsed'
    $('#cover-button').toggleClass 'collapsed'

  if Uno.is 'device', 'desktop'
    $('.cover').addClass 'animated'
    if Uno.is 'page', 'home'
      if isOpen
        _collapsed()
      else
        _expand()
    else
      _collapsed()
  else
    _collapsed()
