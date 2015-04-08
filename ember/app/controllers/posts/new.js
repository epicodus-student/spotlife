import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createPost: function() {
      var email = this.get('email');
      var body = this.get('body');

      var newPost = this.store.createRecord('post', {
        email: email,
        body: body,
      });

      this.set('name', "");
      this.set('body', "");

      newPost.save();

      this.transitionToRoute('index');
    }
  }
});
