import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    /**
     * We refresh the links from the database by feeding on the back-end
     */
    refresh: function() {
      Ember.$.ajax({
        url: '/api/links/feed',
      });
    }
  }
});
