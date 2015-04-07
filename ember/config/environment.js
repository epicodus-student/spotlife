/* jshint node: true */

module.exports = function(environment) {
  var ENV = {

         railsCsrf: {
             csrfURL: 'api/csrf'
           }

  ENV['simple-auth'] = {
    authorizer: 'simple-auth-authorizer:devise'
  };
  return ENV;
};
