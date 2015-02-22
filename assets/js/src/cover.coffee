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

  # $(".btn-mobile-menu").click ->
  #   /* now is #search-container */
  #   $(".navigation-wrapper").toggleClass "visible animated bounceInDown"
  #   $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"

  # $(".navigation-wrapper .blog-button").click ->
  #   /* now is #search-container */
  #   $(".navigation-wrapper").toggleClass "visible"
  #   $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"
