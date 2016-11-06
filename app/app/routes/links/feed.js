import Ember from 'ember';

export default Ember.Route.extend({
  afterModel() {
    this.controllerFor('links/feed').send('refresh');
    this.transitionTo('links');
  }
});
