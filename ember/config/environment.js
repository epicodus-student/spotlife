/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'spotlife',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    railsCsrf: {
      csrfURL: 'api/csrf'
    },
    APP: {
      
    }
  }

  ENV['simple-auth'] = {
    authorizer: 'simple-auth-authorizer:devise'
  };
  return ENV;
};
