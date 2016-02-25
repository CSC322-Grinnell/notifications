# Head Start Parent Notifications [![Build Status](https://travis-ci.org/CSC322-Grinnell/notifications.svg?branch=master)](https://travis-ci.org/CSC322-Grinnell/notifications)
=============
Make it easy for Head Start teachers to notify parents of school closures and other events via text messages.


## Installation
* Clone the repository into a local directory.
* `bundle install --without production`
* `rake db:migrate`
* `rails s`

### F.A.Q.
_I'm having a problem installing the Postgres `pg` gem. What's up with that?_

> Postgres is only used in our production version. If you're trying to set up a developmental working copy, make sure you're using `bundle install --without production` to install the sqlite gem instead.
