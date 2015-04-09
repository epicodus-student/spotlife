import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    createRequestEmail: function() {

      var newRequestEmail = this.store.createRecord('RequestEmail', {});

      newRequestEmail.save();

      this.transitionToRoute('index');
    }
  }
});
