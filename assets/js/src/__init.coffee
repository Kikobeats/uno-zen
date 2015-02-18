'use strict'

$ ->
  window.Uno = Uno =
    version: '1.3.2'

    cover:
      width: -> $(".cover").width()
      isCollapsed: -> $(".cover").hasClass("collapsed")
      collapsed: ->
        $(".cover").addClass("collapsed")
      collapsedWithAnimation: ->
        $(".cover").addClass("collapsed animated")

    search:
      container: -> $('#results')
      form: (action) -> $("#search")[action]()

    loadingBar: (action) -> $(".pace")[action]()

    context: ->
      # get the context from the first class name of body
      # https://github.com/TryGhost/Ghost/wiki/Context-aware-Filters-and-Helpers
      className = document.body.className.split(" ")[0].split("-")[0]
      if className is "" then 'error' else className

    readTime: do ->
      container = $('.content-wrapper')
      readingTime = $(".post-reading-time")
      isPostPage = container.length > 0 and readingTime.length > 0
      isPostListPage = $(".post.date").length > 0

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
        DateInDays ".post.date"
      else if isPostPage
        DateInDays '.post.meta > time', ->
          container.readingTime readingTimeTarget: ".post-reading-time"

  el = document.body
  context = el.dataset.page ?= Uno.context()
  Uno.cover.collapsed() if context is 'post'
  FastClick.attach(el) if el.dataset.device isnt 'desktop'

  $('#panic-button').click ->
    s = document.createElement('script')
    s.setAttribute('src','/assets/js/tdfw.js')
    document.body.appendChild(s)
