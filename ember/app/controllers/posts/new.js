import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createPost: function() {
      var body = this.get('body');

      var newPost = this.store.createRecord('post', {
        body: body,
      });

      this.set('body', "");

      newPost.save();

      this.transitionToRoute('posts');
    }
  }
});
