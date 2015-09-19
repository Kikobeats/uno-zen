# Uno Zen for Ghost

![Last version](https://img.shields.io/github/tag/Kikobeats/uno-zen.svg?style=flat-square)
[![Gittip](https://img.shields.io/badge/Ghost-0.7.x-brightgreen.svg?style=flat-square)]()
[![Donate](https://img.shields.io/badge/donate-paypal-blue.svg?style=flat-square)](https://paypal.me/kikobeats)

> Minimalist and Elegant theme for Ghost.

[<img src="http://i.imgur.com/LCSB4Ca.jpg">](http://kikobeats.com)

**Uno Zen** is a fork of [Uno for Ghost](https://github.com/daleanthony/Uno) that provides some features missing in the original theme.

## Whats is new in 2.0

- Totally rewritten using HTML5 and CSS3.
- Improved development workflow with gulp + browersync.
- Improved responsive and mobile experience.
- Improved SEO Content with meta tags.

Things that already existed:

- A good [404 page error](http://kikobeats.com/404).
- Search support.
- Multiaccount support.
- Loading progress state for each page.
- Estimation about the time of reading.

For more information check [changelog](https://github.com/Kikobeats/uno-zen/blob/master/CHANGELOG.md) section.

## Demo

You can see a demo in my [blog](http://kikobeats.com). Also you can check the [styleguide](http://kikobeats.com/styleguide) to view how it looks.


## Installation

Enter in the theme folder (`content/themes`) of your Ghost installation and:

```bash
$ npm install uno-zen && mv node_modules/uno-zen uno-zen && (trash node_modules || rm -r node_modules)
```

**NOTE:** This theme needs jQuery to works fine, but jQuery library is not provided by the library. Instead, you need to inject from the `Blog Footer` in the `Code injection` of your Ghost installation, as:

![](https://camo.githubusercontent.com/f600498109f9b8e7d15fadd28b51c75b1f585d0f/687474703a2f2f692e696d6775722e636f6d2f4b365a595933752e706e67)

```html
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
```

## Documentation

If is your first time using Ghost, please check the [Official Documentation](http://support.ghost.org/installation/).

All the information you need to know about the theme is collected on the [Documentation](https://github.com/Kikobeats/uno-zen/blob/master/DOCUMENTATION.md) section.

## Showcase

<div align="center">
<a target="blank" href="http://kikobeats.com"><img src="http://i.imgur.com/crE8jt2.png"></a>
<a target="blank" href="http://www.evilsocket.net"><img src="http://i.imgur.com/qanAbQf.png"></a>
<a target="blank" href="http://pupboss.com"><img src="http://i.imgur.com/0AeVKgB.png"></a>
<a target="blank" href="http://www.flaviocorpa.com"><img src="http://i.imgur.com/1ESq2xs.png" /></a>
<a target="blank" href="http://morris.guru"><img src="http://i.imgur.com/s9oimfG.png" /></a>
<a target="blank" href="https://www.mooash.me"><img src="http://i.imgur.com/Ojmkuvw.png" /></a>
<a target="blank" href="http://jahlom.com"><img src="http://i.imgur.com/qwgQ9Ay.png" /></a>
<a target="blank" href="http://adrianperez.org"><img src="http://i.imgur.com/XlNFWWA.png" /></a>
<a target="blank" href="http://www.bradenericson.com"><img src="http://i.imgur.com/8wz0LKN.png" /></a>
<a target="blank" href="https://blog.h4t0n.com"><img src="http://i.imgur.com/GPWzqnG.png" /></a>
<a target="blank" href="https://www.guovz.com"><img src="http://i.imgur.com/62TktSa.jpg" /></a>
<a target="blank" href="http://robinz.in"><img src="http://i.imgur.com/qDAbrch.jpg" /></a>
<a target="blank" href="http://www.iayon.com"><img src="http://i.imgur.com/vzZXfkf.png" /></a>
<a target="blank" href="http://gln.me"><img src="http://i.imgur.com/v7N4hvi.png" /></a>
<a target="blank" href="http://biercoff.com"><img src="http://i.imgur.com/goS3pE3.jpg" /></a>
<a target="blank" href="https://randy.sesser.me"><img src="http://i.imgur.com/9hacUJc.jpg" /></a>
</br>
</br>
</div>

Do you want appear here? Please, [add your blog!](https://github.com/Kikobeats/uno-zen/issues/new?title=Add%20my%20blog%20into%20showcase&body=The%20URL%20of%20my%20blog%20is:%20).

## License

MIT © [Kiko Beats](kikobeats.com)
