'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  if Uno.is 'page', 'home'
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'
    $(".content-wrapper").hide() unless isOpen

  if isOpen or not Uno.is 'page', 'home'
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
