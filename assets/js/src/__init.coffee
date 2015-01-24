"use strict"

$(document).ready ->

  window.Uno = Uno =

    version: '1.1.24'

    cover:
      width: -> $(".panel-cover").width()
      isCollapsed: -> $(".panel-cover").hasClass("panel-cover--collapsed")

    search:
      container: -> $('#results')
      form: (action) -> $("#search")[action]()

    loadingBar: (action) -> $(".pace")[action]()

    readTime: do ->

      container = $('.content-wrapper')
      readingTime = $(".post-reading-time")
      isPostPage = container.length > 0 and readingTime.length > 0
      isPostListPage = $(".post-list__meta > time").length > 0

      DateInDays = (selector, cb) ->
        $(selector).each ->
          postDate = $(this).html()
          postDateNow = new Date(Date.now())
          postDateInDays = Math.floor((postDateNow - new Date(postDate)) / 86400000)

          if postDateInDays is 0 then postDateInDays = 'today'
          else if postDateInDays is 1 then postDateInDays = "yesterday"
          else postDateInDays = "#{postDateInDays} days ago"

          $(this).html(postDateInDays)
          $(this).mouseover -> $(this).html(postDate)
          $(this).mouseout -> $(this).html(postDateInDays)
        cb?()

      if isPostListPage
        DateInDays ".post-list__meta > time"
      else if isPostPage
        DateInDays '.post-meta > time', ->
          container.readingTime readingTimeTarget: ".post-reading-time"

  $("body").removeClass "no-js"
