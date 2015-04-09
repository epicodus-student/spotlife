import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createSpotlightEmail: function() {

      var newSpotlightEmail = this.store.createRecord('SpotlightEmail', {});

      newSpotlightEmail.save();

      this.transitionToRoute('index');
    }
  }
});
