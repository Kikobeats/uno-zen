"use strict"

$(document).ready ->

  el = document.body

  if not Uno.cover.isCollapsed()
    if el.dataset.device is 'desktop'
      $(".navigation--social").css "margin-left", "1.5em"
    Uno.loadingBar 'hide'
    Uno.search.form 'hide'

  $("a.blog-button").click ->
    Uno.search.form 'show'
    $(".navigation--social").css "margin-left", "0px;"

    unless Uno.cover.isCollapsed()
      if Uno.cover.width() < 960
        $(".panel-cover").addClass "panel-cover--collapsed"
        $(".content-wrapper").addClass "animated slideInRight"
      else
        $(".navigation--social").css "margin-left", "0px"
        $(".panel-cover").css "max-width", Uno.cover.width()
        $(".panel-cover").animate
          "max-width": "400px"
          width: "28%"
        , 400, swing = "swing", -> {}

  if location.hash is "#open"
    $(".navigation--social").css "margin-left", "0px"
    $(".panel-cover").addClass "panel-cover--collapsed"
    Uno.search.form 'show'

  if location.pathname isnt "/"
    Uno.search.form 'show'

  checkMobileLocation = ->
    isHome = location.pathname is "/"
    isOpen = location.hash is "#open"
    console.log isHome
    console.log isOpen
    if isHome
      action = if isOpen then 'show' else 'hide'
      $(".content-wrapper")[action]()

  do checkMobileLocation
  $(window).on 'hashchange', checkMobileLocation

  if el.dataset.page is 'tag'
    $(".panel-cover").addClass "panel-cover--collapsed"

  $(".btn-mobile-menu").click ->
    $(".navigation-wrapper").toggleClass "visible animated bounceInDown"
    $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"

  $(".navigation-wrapper .blog-button").click ->
    $(".navigation-wrapper").toggleClass "visible"
    $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"
