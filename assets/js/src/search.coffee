'use strict'

showSearch = ->
  $(".content-wrapper__inner").hide()
  $('#search-results').css "margin-top", "3rem"
  $('#search-results').css "margin-bottom", "9rem"

hideSearch = ->
  $(".content-wrapper__inner").show()
  $('#search-results').css "padding-top", "0"
  $('#search-results').css "margin-bottom", "0"

$ ->
  $("#search-field").ghostHunter
    results           : "#search-results"
    zeroResultsInfo   : false
    onKeyUp           : true
    displaySearchInfo : true
    onComplete        : (query) ->
      if query.length > 0 then showSearch() else hideSearch()
