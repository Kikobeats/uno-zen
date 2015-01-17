"use strict"

$(document).ready ->

  window.Uno = Uno =

    version: '1.1.17'

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

      if container.length > 0 and readingTime.length > 0
        postDate = $('.post-meta > time').html()
        postDateNow = new Date(Date.now())
        postDateInDays = Math.floor((postDateNow - new Date(postDate)) / 86400000)

        if postDateInDays is 0 then postDateInDays = 'today'
        else if postDateInDays is 1 then postDateInDays = "yesterday"
        else postDateInDays = "#{postDateInDays} days ago"

        $('.post-meta > time').html(postDateInDays)
        $('.post-meta > time').mouseover -> $(this).html(postDate)
        $('.post-meta > time').mouseout -> $(this).html(postDateInDays)
        container.readingTime readingTimeTarget: ".post-reading-time"

  $("body").removeClass "no-js"
