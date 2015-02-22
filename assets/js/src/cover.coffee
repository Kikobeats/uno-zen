'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _expand = ->
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $(".cover").removeClass 'collapsed'
    $(".main").hide() unless isOpen

  _collapsed = ->
    $(".cover").addClass("collapsed")
    Uno.search.form 'show'
    $('.social').removeClass 'expanded'

  if Uno.is 'page', 'home'
    $('.cover').addClass 'animated'
    _expand()

  _collapsed() if isOpen or not Uno.is 'page', 'home'

  $('#blog-button').click ->
    $('.cover').toggleClass 'collapsed'
    Uno.search.form 'toggle'
    $('.social').toggleClass 'expanded'
    action = if $('.main').is(":visible") then 'hide' else 'show'
    $('.main')[action]()

  $("#cover-button").click ->
    $('.cover').toggleClass 'collapsed'
    $('.main').toggleClass 'collapsed'
    $('#cover-button').toggleClass 'collapsed'

  if (not Uno.is 'device', 'desktop') and (Uno.is 'page', 'home')
    $("#blog-button").trigger('click')
