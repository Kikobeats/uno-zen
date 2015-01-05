var hideSearchForm = function(){
  $("#search").hide();
};

var showSearchForm = function(){
  $("#search").show();
};

$(document).ready(function() {
    console.debug("Enjoy watching the code :-) ~ Kiko");
    if (!$(".panel-cover").hasClass("panel-cover--collapsed"))
        $(".navigation--social").css("margin-left", "1.5em");

    $("body").removeClass("no-js");
    hideSearchForm();

    $("a.blog-button").click(function() {
        showSearchForm();
        $(".navigation--social").css("margin-left", "0px;");
        if ($(".panel-cover").hasClass("panel-cover--collapsed")) return;
        currentWidth = $(".panel-cover").width();
        if (currentWidth < 960) {
            $(".panel-cover").addClass("panel-cover--collapsed");
            $(".content-wrapper").addClass("animated slideInRight");
        } else {
            $(".navigation--social").css("margin-left", "0px");
            $(".panel-cover").css("max-width", currentWidth);
            $(".panel-cover").animate({
                "max-width": "400px",
                width: "28%"
            }, 400, swing = "swing", function() {});
        }
    });
    if (window.location.hash && window.location.hash == "#open") {
        $(".navigation--social").css("margin-left", "0px");
        $(".panel-cover").addClass("panel-cover--collapsed");
        showSearchForm();
    }
    if (window.location.pathname && window.location.pathname !== '/')
        showSearchForm();

    if (window.location.pathname.substring(0, 5) == "/tag/") {
        $(".panel-cover").addClass("panel-cover--collapsed");
    }
    $(".btn-mobile-menu").click(function() {
        $(".navigation-wrapper").toggleClass("visible animated bounceInDown");
        $(".btn-mobile-menu__icon").toggleClass("icon-list icon-x-circle animated fadeIn");
    });
    $(".navigation-wrapper .blog-button").click(function() {
        $(".navigation-wrapper").toggleClass("visible");
        $(".btn-mobile-menu__icon").toggleClass("icon-list icon-x-circle animated fadeIn");
    });
});
