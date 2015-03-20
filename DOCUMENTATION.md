# Installation

Put a terminal in the `content/themes` folder of your Ghost installation.

[Download the lastest version](https://github.com/Kikobeats/uno-zen/releases).

Deploy your server and after that enter in the Admin area and changes the theme in the UI panel.

# Development

## Understanding scenario

The code of the theme is divided in 3 main sections: static files (as HTML and images), CSS and JS. Check out the folders tree:

```
.
├── LICENSE.md
├── README.md
├── assets
│   ├── css
│   │   └── uno.css # the production css
│   ├── fonts
│   ├── img # favicons and cover image
│   ├── js
│   │   ├── src
│   │   │   ├── __init.coffee
│   │   │   ├── cover.coffee
│   │   │   ├── main.coffee
│   │   │   └── search.coffee
│   │   └── uno.js # the production js
│   └── scss
│   │   ├── components # specific stuff
│   │   │   ├── _aside.scss
│   │   │   ├── _loading.scss
│   │   │   ├── _media-queries.scss
│   │   │   ├── _page-error.scss
│   │   │   ├── _pagination.scss
│   │   │   ├── _post.scss
│   │   │   └── _search.scss
│   │   ├── modules # basic stuff
│   │   │   ├── _buttons.scss
│   │   │   ├── _effects.scss
│   │   │   ├── _fonts.scss
│   │   │   ├── _forms.scss
│   │   │   ├── _global.scss
│   │   │   ├── _grid.scss
│   │   │   ├── _mixins.scss
│   │   │   ├── _reset.scss
│   │   │   └── _variables.scss
│   │   └── uno.scss # main file to create the CSS
|   └── vendor # frontend dependencies
├── bower.json
├── default.hbs
├── error.hbs
├── gulpfile.coffee
├── index.hbs
├── node_modules
├── package.json
├── partials # different partials view
│   ├── aside.hbs
│   ├── comments.hbs
│   ├── footer.hbs
│   ├── google-analytics.hbs
│   ├── links.hbs
│   ├── list-posts.hbs
│   ├── meta.hbs
│   ├── pagination.hbs
│   ├── search.hbs
│   └── social.hbs
├── post.hbs
└── tag.hbs
```

Putting the files in context:

- The JS inside `assets/js/src` is compiled into `assets/js/uno.js`
- The SCSS (we use [SASS](http://sass-lang.com/)) inside `assets/scss` is compiled into `assets/css/uno.css`
- We have some static files like `post.hbs`, `tag.hbs`, `default.hbs`, `index.hbs`,... the partials views inside `assets/partials` is used in this views.

For do it automatically and easily we use [Gulp](http://gulpjs.com/), check `gulpfile.coffee` for know how to we do it.

## First Steps

For local development you need to have a locally Ghost server, like this:

```bash
node index.js
Migrations: Up to date at version 003
Ghost is running in development...
Listening on 127.0.0.1:2387
Url configured as: http://127.0.0.1:2387
Ctrl+C to shut down
```

Note that my local Ghost is running in the port `2387`.

With your local Ghost running, open another terminal and enter in the folder `content/themes` of your local Ghost and clone the theme repository and install the dependencies for local development:

```bash
$ git clone https://github.com/Kikobeats/uno-zen && npm install && bower install
```

Just run `gulp` command in the theme terminal. Now you have a development scenario, and looks like this:

![](http://i.imgur.com/Gf4gPR2.png)

With the `gulp` command you are automatically launching the task for compile the assets and reload the server when your assets change. For do it we uses [BrowserSync](http://www.browsersync.io) that is setup as middleware between the theme and the Ghost. You can connect different devices and try the responsive of the website as well.

As the screenshot, you need to use for the proxying the same port as your Ghost server. If your Ghost server is in a different port than `2387` you need to modify `gulpfile.coffee` and put the correct port.

## Customization

### Google Analytics

Edit `partials/google-analytics.hbs` put your [Google Analytics](http://www.google.com/analytics) domain ID in the line 6 like:

```
ga('create', 'UA-YOURIDHERE', 'auto');
```

### Comments

Edit `partials/comments.hbs` and put your [Disqus](https://disqus.com) shorcut in the line 5 like:

```
var disqus_shortname = 'myShorcut';
```

### Sidebar Name

Edit the file `partials/aside.hbs` and change the name to show modifying the `h1` header.

The description is automatically obtained from the description of the blog.

### Colors

Edit the file `assets/scss/modules/_variables.scss`.

### Social Networks

Edit the file `partials/social.hbs`.

### Links

Edit the file `partials/links.hbs`

### Favicon

Create your favicons with [Favicon Generator](http://realfavicongenerator.net/) and puts it in `assets/img`.

### Cover

Replace the `assets/img/cover.jpg` file. If you put another with different extensin remember modify the CSS for do it.

### Multiaccount support

You can enable the multiaccount support for post editing the `posts.hbs` and editing the code commented inside the meta post information.

## Preparing for production

When you consider that the development is done and you want to deploy a new version, package your code using `gulp build` command, that minify and concatenate all necessary code.
