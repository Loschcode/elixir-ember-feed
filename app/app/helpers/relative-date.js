export default Ember.Helper.helper(function([date]) {
  return moment(date).fromNow();
});
