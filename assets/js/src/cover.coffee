'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _expand = ->
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $(".cover").removeClass 'collapsed'
    $(".main").hide()

  _collapsed = ->
    $(".cover").addClass("collapsed")
    Uno.search.form 'show'
    $('.social').removeClass 'expanded'
    $(".main").show()

  $('#blog-button').click ->
    $('.cover').toggleClass 'collapsed'
    Uno.search.form 'toggle'
    $('.social').toggleClass 'expanded'
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
