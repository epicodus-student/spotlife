import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('protected');
  this.route('signup');
  this.resource('posts', function() {
    this.route('new');
  });
  this.route('request_emails', function() {
    this.route('new');
  });
  this.route('work');
});

export default Router;
