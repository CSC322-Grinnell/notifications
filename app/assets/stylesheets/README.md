This directory houses all the stylesheets for the entire Notifications project.  In order to keep it maintainable, the [Style Guide](#sass-style-guide) should be followed.

# Project Layout 

- README.md
- [base.css.scss]()
- [application.css.scss]()
- [globals](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/globals)
    - [_all.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_all.scss)
    - [_functions.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_functions.scss)
    - [_mixins.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_mixins.scss)
    - [_variables.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_variables.scss)
- [layout](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/layout)
    - [main.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/main.css.scss)
    - [history.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/history.css.scss)    
    - [login.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/login.css.scss)
    - [sendmessage.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/sendmessage.css.scss)
    - [users.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/users.css.scss)
- [modules](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/modules)
    - [main.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/main.css.scss)
    - [alert.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/alert.css.scss)
    - [button.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/button.css.scss)

# Sass Style Guide

### General

* 

### Declare all variables first


### Declare mixins second

    * If a mixin is used in more than one file, define it in the mixins file.


### Declare styles next

### Indentation
    * 4 spaces per indentation level.  Do not use tabs.
    * 

Be consistant about where spaces before/after colons/braces go

List extends first.
List includes next.
List regular styles next.
Nested pseudo classes next. (hover, clicked)
Nested selectors last. (subclasses)

One selector per line, One rule per line
List related properties together