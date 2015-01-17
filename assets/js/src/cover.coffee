"use strict"

$(document).ready ->

  unless Uno.cover.isCollapsed()
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

  if window.location.pathname and window.location.pathname isnt "/"
    Uno.search.form 'show'

  if window.location.pathname.substring(0, 5) is "/tag/"
    $(".panel-cover").addClass "panel-cover--collapsed"

  $(".btn-mobile-menu").click ->
    $(".navigation-wrapper").toggleClass "visible animated bounceInDown"
    $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"

  $(".navigation-wrapper .blog-button").click ->
    $(".navigation-wrapper").toggleClass "visible"
    $(".btn-mobile-menu__icon").toggleClass "icon-list icon-x-circle animated fadeIn"
