import Ember from 'ember';
import startApp from '../helpers/start-app';
import { module, test } from 'qunit';
import Pretender from 'pretender';

var App, server;

module('Integration - Post Page', {
  beforeEach: function() {
    App = startApp();
    var user = {id: 1, email: "John", password: "password"};
    var posts = [
      {
        id: 1,
        user_id: 1,
        body: 'Bugs Bunny'
      },
      {
        id: 2,
        user_id: 1,
        body: 'Wile E. Coyote'
      },
      {
        id: 3,
        user_id: 1,
        body: 'Yosemite Sam'
      }
    ];

server = new Pretender(function() {
  this.get('/api/posts', function(request) {
    return [200, {"Content-Type": "application/json"}, JSON.stringify({posts: posts})];
  });

  this.get('/api/posts/:id', function(request) {
    var post = posts.find(function(post) {
      if (post.id === parseInt(request.params.id, 10)) {
        return post;
      }
    });

    return [200, {"Content-Type": "application/json"}, JSON.stringify({post: post})];
  });
});

},
afterEach: function() {
  Ember.run(App, 'destroy');
  server.shutdown();
}
});

test('Should allow navigation to the posts page from the landing page', function(assert) {
  visit('/').then(function() {
    click('a:contains("Posts")').then(function() {
      assert.equal(find('h3').text(), 'Posts');
      // add id to h3
    });
  });
});

test('Should list all posts', function(assert) {
  visit('/posts').then(function() {
    assert.equal(find('p:contains("Bugs Bunny")').length, 1);
    assert.equal(find('p:contains("Wile E. Coyote")').length, 1);
    assert.equal(find('p:contains("Yosemite Sam")').length, 1);
  });
});
