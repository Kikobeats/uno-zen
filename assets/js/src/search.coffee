"use strict"

## -- Private -----------------------------------------------------------------

showSearch = ->
  $(".content-wrapper__inner").hide()
  Uno.search.container.css "margin-top", "3rem"
  Uno.search.container.css "margin-bottom", "9rem"

hideSearch = ->
  $(".content-wrapper__inner").show()
  Uno.search.container.css "padding-top", "0"
  Uno.search.container.css "margin-bottom", "0"

## -- Main --------------------------------------------------------------------

$(document).ready ->
  $("#search-field").ghostHunter
    results           : "#results"
    zeroResultsInfo   : false
    onKeyUp           : true
    displaySearchInfo : true
    onComplete        : (query) ->
      if query.length > 0 then showSearch() else hideSearch()
