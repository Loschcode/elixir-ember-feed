import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return Ember.RSVP.hash({
      links: this.store.findAll('link')
    });
  },
});
