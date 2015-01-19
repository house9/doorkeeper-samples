# Doorkeeper Samples

Sample rails applications using doorkeeper

_**WIP:** Work in progress_

## The apps

* keeper_of_things
  * run at http://localhost:3000/
  * Uses devise and doorkeeper to manage user accounts
  * see public directory for various client side oauth examples
* acme_widget_app
  * run at http://localhost:3010/
  * Application that manages Widgets
  * Must Authenticate via user account from `keeper_of_things` application

### Doorkeeper models

```
Doorkeeper::Application
Doorkeeper::AccessGrant
Doorkeeper::AccessToken
```


## Acme Widget App

### Doorkeeper OAuth flow, user is NOT logged in

```ruby
# ======== Acme Widget
'GET "/auth/keeper" at 2014-04-27 17:02:03 -0700'
'invokes the OmniAuth strategy keeper'
# ======== Keeper
'GET "/oauth/authorize?..." at 2014-04-27 17:02:03 -0700'
'Completed 401 Unauthorized in 28ms'
'GET "/users/sign_in" at 2014-04-27 17:02:03 -0700'
# User enters login credentials
'POST "/users/sign_in" at 2014-04-27 17:03:31 -0700'
# User presented with authorize screen
'GET "/oauth/authorize?..." at 2014-04-27 17:03:31 -0700'
# User accepts authorize
'POST "/oauth/authorize" at 2014-04-27 17:04:24 -0700'
'Redirected to http://localhost:3010/auth/keeper/callback?code=...'
# ======== Acme Widget
'GET "/auth/keeper/callback?code=..." at 2014-04-27 17:04:24 -0700'
'INFO -- omniauth: (keeper) Callback phase initiated.'
'Does a POST to keeper for AuthToken and sets on session'
'Then immediatly does GET for user info'
'Redirected to http://localhost:3010/'
# ======== Keeper
'POST "/oauth/token" at 2014-04-27 17:04:24 -0700'
'creates AccessToken and AccessGrant records'
'GET "/api/v1/me" at 2014-04-27 17:04:24 -0700'
# ======== Acme Widget
'Now at http://localhost:3010/ with the user authenticated and authorized'
```

### Doorkeeper OAuth flow, user IS logged in

```ruby
# ======== Acme Widget
'GET "/auth/keeper" at 2014-04-27 17:31:32 -0700'
'invokes the OmniAuth strategy keeper'
# ======== Keeper
'GET "/oauth/authorize?..." at 2014-04-27 17:31:32 -0700'
'Render /app/views/doorkeeper/authorizations/new'
# User accepts authorize
'POST "/oauth/authorize" at 2014-04-27 17:33:17 -0700'
'Redirected to http://localhost:3010/auth/keeper/callback?code=...'
# ======== Acme Widget
'GET "/auth/keeper/callback?code=..." at 2014-04-27 17:33:17 -0700'
'INFO -- omniauth: (keeper) Callback phase initiated.'
'Does a POST to keeper for AuthToken and sets on session'
'Then immediatly does GET for user info'
'Redirected to http://localhost:3010/'
# ======== Keeper
'POST "/oauth/token" at 2014-04-27 17:33:17 -0700'
'creates AccessToken and AccessGrant records'
'GET "/api/v1/me" at 2014-04-27 17:33:17 -0700'
# ======== Acme Widget
'Now at http://localhost:3010/ with the user authenticated and authorized'
```

### Doorkeeper OAuth flow, user IS logged in and AUTO authorize

```ruby
# ======== Acme Widget
'GET "/auth/keeper" at 2014-04-27 17:47:38 -0700'
'invokes the OmniAuth strategy keeper'
# ======== Keeper
'GET "/oauth/authorize?..." at 2014-04-27 17:47:38 -0700'
'By pass authorization page for "Acme Widget" application'
'Redirected to http://localhost:3010/auth/keeper/callback?code=...'
# ======== Acme Widget
'GET "/auth/keeper/callback?code=..." at 2014-04-27 17:47:38 -0700'
'INFO -- omniauth: (keeper) Callback phase initiated.'
'Does a POST to keeper for AuthToken and sets on session'
'Then immediatly does GET for user info'
'Redirected to http://localhost:3010/'
# ======== Keeper
'POST "/oauth/token" at 2014-04-27 17:47:38 -0700'
'creates AccessToken and AccessGrant records'
'GET "/api/v1/me" at 2014-04-27 17:47:38 -0700'
# ======== Acme Widget
'Now at http://localhost:3010/ with the user authenticated and authorized'
```

## Client side Oauth examples

Setup doorkeeper application

```
cd keeper_of_things
bundle
rake db:create
rake db:migrate
rake db:seed
rails server
```

### jso2

Go to [http://localhost:3000/jso2.html](http://localhost:3000/jso2.html) and watch the console.

You should be redirected to the login page: Use the following to login, or create a new account.

* test-1@example.com
* 11122211

Click the 'Show Token' link, if using a short time out you should receive a new token shortly.

NOTE: seems to work even without [Refresh Tokens](https://github.com/doorkeeper-gem/doorkeeper/wiki/Enable-Refresh-Token-Credentials) configured.

Click the 'Get Items' link to make authorized requests which fetch 'Item' records associated with the user.

## Resources

* [http://railscasts.com/episodes/353-oauth-with-doorkeeper](http://railscasts.com/episodes/353-oauth-with-doorkeeper)
* [http://railscasts.com/episodes/235-devise-and-omniauth-revised](http://railscasts.com/episodes/235-devise-and-omniauth-revised)
* [https://github.com/doorkeeper-gem/doorkeeper](https://github.com/doorkeeper-gem/doorkeeper)
* [https://github.com/intridea/omniauth-oauth2](https://github.com/intridea/omniauth-oauth2)
* [OAuth Implicit Grant with Grape, Doorkeeper and AngularJS](http://codetunes.com/2014/oauth-implicit-grant-with-grape-doorkeeper-and-angularjs/)


## Javascript OAuth Clients and other links

* http://stackoverflow.com/questions/4121570/oauth2-for-javascript
* https://github.com/andreassolberg/jso/tree/master
* https://github.com/andreassolberg/jso/tree/version2
* https://developers.google.com/accounts/docs/OAuth2UserAgent
* https://gist.github.com/hannestyden/563893
* https://github.com/ox-it/javascript-oauth2
* https://github.com/enginous/angular-oauth
* http://devcenter.kinvey.com/angular/tutorials/how-to-implement-safe-signin-via-oauth
* http://adodson.com/hello.js/
* http://aaronparecki.com/articles/2012/07/29/1/oauth2-simplified#browser-based-apps

