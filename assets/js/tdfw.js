(function() {
    var lastTime = 0;
    var vendors = ['ms', 'moz', 'webkit', 'o'];
    for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
        window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
        window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame']
                                   || window[vendors[x]+'CancelRequestAnimationFrame'];
    }

    if (!window.requestAnimationFrame)
        window.requestAnimationFrame = function(callback, element) {
            var currTime = new Date().getTime();
            var timeToCall = Math.max(0, 16 - (currTime - lastTime));
            var id = window.setTimeout(function() { callback(currTime + timeToCall); },
              timeToCall);
            lastTime = currTime + timeToCall;
            return id;
        };

    if (!window.cancelAnimationFrame)
        window.cancelAnimationFrame = function(id) {
            clearTimeout(id);
        };
}());
(function() {
  var player;
  var turndownAt = 20
  var numTurntAnimations = 10
  var turntDown = false;
  var maxNodes = 1000;
  var animationCSS = {
    'tdfw_intro': 'tdfwIntro 1s infinite ease-in-out',
    'turntDown': function() {
      var key = ~~ ( Math.random() * numTurntAnimations)
      return 'turntDown' + key + ' 5s infinite ease-in-out'
    }
  }
  var firstAddition = true
  function embedVideo() {
    var parent = document.createElement('div')
    parent.style.position = 'fixed'
    parent.style.zIndex = 5000;
    parent.style.right = 0;
    parent.style.top = 0
    parent.style.display = 0.2
    var div = document.createElement('div')
    div.id = "tdfw"
    parent.appendChild(div)
    document.body.appendChild(parent)
    parent.onmouseover = function() {
      console.log('mouse')
      parent.style.opacity = 1
    }
    parent.onmouseout = function() {
      parent.style.opacity = 0.2
    }
    parent.style.webkitTransition = 'opacity 0.3s ease-in-out'
    parent.style.transition = 'opacity 0.3s ease-in-out'

    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.body.appendChild(tag)
    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    function onYouTubeIframeAPIReady() {
      player = new YT.Player('tdfw', {
        height: '200',
        width: '305',
        videoId: 'HMUDVMiITOU',
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
      });
    }
    window.onYouTubeIframeAPIReady = onYouTubeIframeAPIReady
  }
  function onPlayerReady(event) {
    console.log('ready')
    event.target.playVideo();
    requestAnimationFrame(checkTime)
  }

  function checkTime() {
    if(turntDown) {
      return false;
    }
    requestAnimationFrame(checkTime);
    if(player.getCurrentTime() > turndownAt) {
      turntDown = true;
      removeCurStyles();
      addCurStyles()
    }

  }
  function onPlayerStateChange(event) {
    console.log(event)
    if(event.data === 1) {
      //started
      addCurStyles()

    } else if(event.data === 2) {
      //paused
      removeCurStyles()
    }
  }
  //<iframe width="560" height="315" src="//www.youtube.com/embed/HMUDVMiITOU?autoplay=1" frameborder="0" allowfullscreen></iframe>

  function setupAnimations() {
    var numKeyFrames = 10
    var introKeyFrames = '';
    var turntKeyFrames = [];
    var jitterAmount = 10;
    for(var i = 0; i < numTurntAnimations; i++) {
      turntKeyFrames[i] = ''
    }
    for(var i = 0; i <= numKeyFrames; i++) {
      var pct = i / numKeyFrames * 100 + '%';

      var x = (Math.random() - 0.5) * jitterAmount
      var y = (Math.random() - 0.5) * jitterAmount
      x = ~~ x
      y = ~~ y
      var keyframe = '-webkit-transform: translate(' + x + 'px,' + y +'px); '
      keyframe += 'transform: translate(' + x + 'px,' + y + 'px);'
      introKeyFrames += pct + ' { ' + keyframe + ' } '
      for(var j = 0; j < numTurntAnimations; j++) {
        var x = (Math.random() - 0.5) * jitterAmount
        var y = (Math.random() - 0.5) * jitterAmount
        x = ~~ x
        y = ~~ y
        var rotationAmount = i / numKeyFrames * 360;
        rotationAmount = ~~ rotationAmount
        var rotateDirection = String.fromCharCode(88 + ~~ (Math.random() * 2))
        var keyframe = '-webkit-transform: translate(' + x + 'px,' + y +'px) rotate' + rotateDirection + '(' + rotationAmount + 'deg); '
        keyframe += 'transform: translate(' + x + 'px,' + y + 'px) rotate' + rotateDirection + '(' + rotationAmount + 'deg); '
        turntKeyFrames[j] += pct + ' { ' + keyframe + ' }'

      }

    }
    var introKeyFrameDef = '@-webkit-keyframes tdfwIntro { ' + introKeyFrames + ' } '
    introKeyFrameDef += '@keyframes tdfwIntro { ' + introKeyFrames + ' } '


    var allStyles = introKeyFrameDef

    for(var i = 0; i < turntKeyFrames.length; i++) {
      var kf = turntKeyFrames[i]
      allStyles += '@-webkit-keyframes turntDown' + i + ' { ' + kf + ' } '
      allStyles += '@keyframes turntDown' + i + ' { ' + kf + ' } '
    }
    var introClass = '.tdfw_intro { -webkit-animation: tdfw 1s infinite; animation: tdfw 1s infinite; } '
    //allStyles += introClass
    var style = document.createElement('style')
    style.textContent = allStyles
    document.body.appendChild(style)
  }


  function addCurStyles() {

    var curClass = getCurClass()
    var nodes = Array.prototype.slice.call(document.querySelectorAll('img'))
    nodes = nodes.concat(Array.prototype.slice.call(document.querySelectorAll('div')))
    nodes = nodes.concat(Array.prototype.slice.call(document.querySelectorAll('span')))
    nodes = nodes.concat(Array.prototype.slice.call(document.querySelectorAll('a')))
    nodes = nodes.concat(Array.prototype.slice.call(document.querySelectorAll('section, header, footer, video, iframe, nav, article, h1, h2, h3, h4, h5, h6, footer, main, p, pre, blockquote, ol, ul, li, embed, object, canvas, svg, form, input, select, button')))

    var max = maxNodes < nodes.length ? maxNodes : nodes.length;

    //console.log(nodes)
    //console.log(max)
    for(var i = 0; i < max ; i++) {
      var node = nodes[i];

      node.classList.add(curClass)
      var delay = Math.round(Math.random() * 1000) / 1000 + 'ms'
      if(firstAddition) {
        delay = ~~ (Math.random() * 10) + 's'
      }
      var css = animationCSS[curClass];
      if(typeof css === 'function') {
        css = css()
      }
      node.style['webkitAnimation'] = css + ' ' + delay
      node.style['animation'] = css + ' ' + delay

    }
    firstAddition = false

  }
  function removeCurStyles() {
    var classes = allClasses()
    var nodes = document.querySelectorAll('*')
    for(var i = 0; i < nodes.length ; i++) {
      var node = nodes[i];
      for(var j = 0; j < classes.length; j++) {
        var cl = classes[j]
        node.classList.remove(cl)
        node.style['webkitAnimation'] = ''
        node.style['animation'] = ''

      }
    }
  }
  function allClasses() {
    return ['tdfw_intro', 'turntDown']
  }
  function getCurClass() {
    if(player.getCurrentTime() > turndownAt) {
      return 'turntDown'
    } else {
      return 'tdfw_intro'
    }

  }

  function init() {
    if(typeof window.tdfw________TDFW !== 'undefined') {
      return;
    }
    window.tdfw________TDFW = true;

    embedVideo()
    setupAnimations()
  }
  init()

})()
