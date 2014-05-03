define.amd = {jQuery : true};
requirejs.config({
    shim: {
        'jquery': {
            exports: '$'
        }
    },
  paths: {
        'jquery': 'http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min'
  }
});


define(function(require, exports, module) {


  var
    OAuth = require('jso2'),
    jQuery = require('jquery');

  OAuth.enablejQuery($);

  $(document).ready(function() {

    var config = {
      client_id: "68d256793f4eb5f8492c340d40f88ecf8d28db034d405c9394b23b84b052b45b",
      base_url: "http://localhost:3000",
      authorize_endpoint: "/oauth/authorize",
      user_endpoint: "/api/v1/me"
    }

    // configure the OAuth client
    var o = new OAuth('jso2', {
      client_id: config.client_id,
      redirect_uri: window.location, // config.base_url + "/jso2.html",
      authorization: config.base_url + config.authorize_endpoint
    });

    // authorize OAuth server
    o.callback();

    // make a request passing the token in the 'Authorization' header, use 'Bearer'
    o.ajax({
      url: config.base_url + config.user_endpoint,
      dataType: 'json',
      success: function(data) {
        console.log("Response Data:");
        console.log(data);

        setTimeout(function () {
          $(".loader-hideOnLoad").hide('slow');
          $("#main").show('slow');
        }, 1000)
      }
    });

    window.showAuthToken = function () {
      o.getToken(function (token) {
        console.log(token.access_token);
      });
    };
  });


});
