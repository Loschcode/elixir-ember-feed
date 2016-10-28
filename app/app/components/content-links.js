import Ember from 'ember';

export default Ember.Component.extend({

  routing: Ember.inject.service('-routing'),

  resolveUrl: Ember.computed('link', function() {

    let description = this.get('link.description');

    if (description == null) {
      return this.get('link.url');
    } else {
      return this.get('routing').generateURL('links.show', this.get('link'));

      //return this.get('route').generate('link.show', this.get('link'));
    }

  })
});
