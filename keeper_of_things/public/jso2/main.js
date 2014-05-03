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

    var o = new OAuth('jso2', {
      client_id: "68d256793f4eb5f8492c340d40f88ecf8d28db034d405c9394b23b84b052b45b",
      redirect_uri: "http://localhost:3000/jso2.html",
      authorization: "http://localhost:3000/oauth/authorize"
    });

    o.callback();

    o.ajax({
      url: "http://localhost:3000/api/v1/me",
      dataType: 'json',
      success: function(data) {
        console.log("Response (app):");
        console.log(data);
        $(".loader-hideOnLoad").hide();
      }
    });

    window.showAuthToken = function () {
      o.getToken(function (token) {
        console.log(token.access_token);
      });
    };
  });


});
