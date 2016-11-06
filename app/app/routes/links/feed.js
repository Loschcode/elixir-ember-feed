import Ember from 'ember';

export default Ember.Route.extend({
  afterModel() {
    /**
     * We basically call the API via the controller method `refresh`
     * And redirect instantly to the links
     */
    this.controllerFor('links/feed').send('refresh');
    this.transitionTo('links');
  }
});
