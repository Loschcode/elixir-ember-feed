export function initialize(application) {
  application.inject('component', 'route', 'route:application');

  // 
  // // Set defaut Ember ajax
  // Ember.$.ajaxSetup({
  //   xhrFields: {
  //     withCredentials: true
  //   },
  //   crossDomain: true
  //
  // });
  //
  // // Set default noty plugin (notification system)
  // $.noty.defaults.timeout = 2200;
  // $.noty.defaults.animation.open = 'animated flipInX';
  // $.noty.defaults.animation.close = 'animated flipOutX';
  // $.noty.defaults.maxVisible = 1;
  // $.noty.defaults.killer = true;
  // $.noty.defaults.dismissQueue = false;
  // $.noty.defaults.dismissQueue = false;


}

export default {
  name: 'init',
  initialize
};
