var initReadTime = function(elem) {
  elem = $(elem);
  readingTime = $('.post-reading-time');
  if (elem.length > 0 && readingTime.length > 0) {
    elem.readingTime({
      readingTimeTarget: '.post-reading-time',
    });
  }
};

$(document).ready(function() {
  initReadTime('.content-wrapper');
});
