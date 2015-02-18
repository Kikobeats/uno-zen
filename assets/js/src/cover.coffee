"use strict"

$ ->
  el = document.body
  isHome = location.pathname is "/"
  isOpen = location.hash is '#open'
  isDesktop = el.dataset.device is 'desktop'

  if isHome
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $(".content-wrapper").hide() unless isOpen
  else
    Uno.cover.collapsed()

  if isOpen
    Uno.cover.collapsed()
    Uno.search.form 'show'
    $('.social.expanded').removeClass 'expanded'

  $('#blog-button').click ->
    Uno.cover.collapsedWithAnimation()
    Uno.search.form 'show'
    $('.social.expanded').removeClass 'expanded'
    $(".content-wrapper").show()


  # $(".btn-mobile-menu").click ->
  #   /* now is #search-container */
  #   $(".navigation-wrapper").toggleClass "visible animated bounceInDown"
  #   $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"

  # $(".navigation-wrapper .blog-button").click ->
  #   /* now is #search-container */
  #   $(".navigation-wrapper").toggleClass "visible"
  #   $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"
