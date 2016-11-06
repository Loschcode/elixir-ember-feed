import Ember from 'ember';
import CONFIG from  '../config/environment';

export default Ember.Component.extend({

  init() {
    this._super();
  },

  myself: CONFIG.APP.myself

});
