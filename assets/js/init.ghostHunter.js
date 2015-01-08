
var searchContainer = $("#results");

var showSearch = function(){
  $(".content-wrapper__inner").hide();
  searchContainer.css('margin-top', '3rem');
  searchContainer.css('margin-bottom', '9rem');
};

var hideSearch = function(){
  $(".content-wrapper__inner").show();
  searchContainer.css('padding-top', '0');
  searchContainer.css('margin-bottom', '0');
};

$(document).ready(function() {
  $("#search-field").ghostHunter({
    results         : "#results",
    zeroResultsInfo : false,
    onKeyUp         : true,
    displaySearchInfo:true,
    onComplete: function(query){
      if (query.length > 0)
        showSearch();
      else
        hideSearch();
    }
  });
});
