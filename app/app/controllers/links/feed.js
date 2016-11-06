import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    refresh: function() {
      Ember.$.ajax({
        url: '/api/links/feed',
      });
    }
  }
});
