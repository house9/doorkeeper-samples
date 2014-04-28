# Doorkeeper Samples

Sample rails applications using doorkeeper

_**WIP:** Work in progress_

## The apps

* keeper_of_things
  * run at http://localhost:3000/
  * Uses devise and doorkeeper to manage user accounts
* acme_widget_app
  * run at http://localhost:3010/
  * Application that manages Widgets
  * Must Authenticate via user account from `keeper_of_things` application
* back_end_consumer
  * TODO
* front_end_consumer
  * TODO
  
### Doorkeeper models

```
Doorkeeper::Application
Doorkeeper::AccessGrant
Doorkeeper::AccessToken
```
  
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


## Resources

* [http://railscasts.com/episodes/353-oauth-with-doorkeeper](http://railscasts.com/episodes/353-oauth-with-doorkeeper)
* [http://railscasts.com/episodes/235-devise-and-omniauth-revised](http://railscasts.com/episodes/235-devise-and-omniauth-revised)
* [https://github.com/doorkeeper-gem/doorkeeper](https://github.com/doorkeeper-gem/doorkeeper)
* [https://github.com/intridea/omniauth-oauth2](https://github.com/intridea/omniauth-oauth2)