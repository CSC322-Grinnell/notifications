# Table of Contents
----
----
#### 1. [Project Layout](#project-layout)
#### 2. [Style Guide](#style-guide)
#### 3. [Contributing](#contributing)
#### 4. [Credits](#credits)

----
----

# Project Layout 

This project uses [**Sass**](http://sass-lang.com/), Syntactically Awesome Style Sheets, for ease of use but mainly to achieve very modular code.  There is no overhead to this process and the client is only served one minified .css file, compiled from all the .css.csss files.  

To manage the code, we use a simplified variant of [**SMACSS**](https://smacss.com/) (Scalable and Modular Architecture for CSS).  SMACSS is a style guide and design process and is used in this process.

Not all of SMACSS's design philosophy is needed, nor used.  We use the concepts of modules, layout, and globals directories.

----

- **Modules**: a discrete, reusable component of a page
    - Modules should function identically or similarly regardless of where they are used on the page.
    - Examples of modules include [buttons](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/button.css.scss), dialog boxes, or error messages.

- **Layouts**: specific sections of the page.
    - Layout styles define the major components regarding the structure of the page. 
    - Generally, a layout style only has a single selector: a single ID or class name.
        - Major sections like header or footer should use an ID selector, while minor sections should probably use class selectors.
    - For example, a "navbar" section of a page would have its own separate navbar.scss file inside of the layout folder.
        - It may contain selectors that target child elements, such as `#navbar .left-pane`, `#navbar .image`, etc.

- **Globals**: reusable variables, mixins, and functions
    - Any code that is used in more than one file goes here.

----

- [base.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/css-documentation/app/assets/stylesheets/base.css.scss)
- [application.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/css-documentation/app/assets/stylesheets/application.css.scss)
- [globals](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/globals)
    - [_all.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_all.scss)
    - [_functions.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_functions.scss)
    - [_mixins.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_mixins.scss)
    - [_variables.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_variables.scss)
- [layout](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/layout)
    - [users.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/users.css.scss)
    - [classrooms.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/classrooms.css.scss)
    - [header.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/header.css.scss)
    - [history.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/history.css.scss)    
    - [login.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/login.css.scss)
    - [main.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/main.css.scss)
    - [navbar.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/navbar.css.scss)
    - [text-layout.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/text-layout.css.scss)
    - [text-recipients.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/text-recipients.css.scss)
    - [text-sendmessage.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/text-sendmessage.css.scss)
    - [users.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/layout/users.css.scss)
- [modules](https://github.com/CSC322-Grinnell/notifications/tree/dev/app/assets/stylesheets/modules)
    - [main.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/main.css.scss)
    - [alert.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/alert.css.scss)
    - [button.css.scss](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/modules/button.css.scss)

----
----
# Style Guide

##### 1. [General Rules](#overview)
##### 2. [Variables](#variables)
##### 3. [Mixins](#mixins)
##### 4. [Functions](#functions)
##### 5. [Colors](#colors)

## Overview

1. Use *kebab-case* for all variable, mixin, and function names.
    > Kebab-case `looks-like-this`, it doesn't `lookLikeThis`.  Don't use CamelCase!

2. Do not use Sass modules (the `@extend` keyword).
    > `@extend` hides functionality, cannot accept arguments, and cannot be used across media queries

3. Order your code in a logical manner.
    - Variable declarations come first - `$border-width = 3px`
    - Include mixins next - `@include no-select();`
    - List regular styles next. - `display: block;`
    - Nested pseudo classes next. - `&::before {}` or `&::hover {}` 
    - Nested selectors last - `li {}` or `> h3`

    An example block with properly ordered sections:

    ```sass
    .some-class {

        $color: #123456;

        @extend %module; 
        @include some-mixin($color);

        background: teal;

        &::after {
            content: "";
            display: block;
        }
        > h3 {
            @include a-different-mixin($color, 20);
            border-bottom: 1px solid blue;
        }
    }
    ```

## Variables

Declare variables that are used in more than one file in [_variables.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_variables.scss). These variables will automatically get imported.  Similarly, declare variables that are only used in one file at the top of the file; for one block, at the top of the block.

## Mixins

Always declare mixins in [_mixins.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_mixins.scss), **unless** the mixin is only to be used inside the current file.

List of Mixins
- no-select() - disables text select, with vendor prefixes
- hidden() - hides an element without removing it from the page
- border-box() - vendor prefixes the border-box box-sizing style
- text-shadow() - shortcut for "text-shadow: 0px 1px 2px rgba(100, 100, 100, 0.8);"

## Functions

Use functions for general and resusable mathematical calculations.  Always declare functions in the [_functions.css](https://github.com/CSC322-Grinnell/notifications/blob/dev/app/assets/stylesheets/globals/_functions.scss) file.

## Colors

General Colors
- Green : [#8DAF2D](http://www.color-hex.com/color/8DAF2D)
- Dark Green : [#5E751E](http://www.color-hex.com/color/5E751E)
- Orange : [#F2C83E](http://www.color-hex.com/color/F2C83E)
- Yellow : [#DB8A11](http://www.color-hex.com/color/DB8A11)
- Cream : [#F6E19B](http://www.color-hex.com/color/F6E19B)

Text Colors
- White : [#FCFDF9](http://www.color-hex.com/color/FCFDF9)
    - Use with Green, Dark Green, and Orange background
- Brown : [#492E05](http://www.color-hex.com/color/492E05)
    - Use with Yellow and Cream background

----

# Contributing

1. Fork or clone the project
2. Make a new branch - do not submit pull requests to dev!
3. Make sure you adhere to the [style guide](#style-guide)
4. Submit a pull request for your branch
5. Delegate someone to do a code review of your changes
6. Once that is done, if the project builds without any errors, and the branches can be merged, an admin will merge the branches

----

# Credits

- Kevin Connors
- Camila Mateo Volkhart

