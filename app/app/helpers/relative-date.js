import Ember from 'ember';
import moment from 'moment';

export default Ember.Helper.helper(function([date]) {
  return moment(date).fromNow();
});
