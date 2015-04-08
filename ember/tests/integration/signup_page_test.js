import Ember from 'ember';
import { module, test } from 'qunit';
import startApp from '../helpers/start-app';

var App;

module('Integration - Sign Up Page', {
  beforeEach: function() {
    App = startApp();
  },
  afterEach: function() {
    Ember.run(App, 'destroy');
  }
});

test('Click sign up should go to the sign up form', function(assert) {
  visit('/').then(function() {
    click("a:contains('Sign Up')").then(function() {
      assert.equal(find('h2#signup').text(), 'Sign Up');
    });
  });
});
