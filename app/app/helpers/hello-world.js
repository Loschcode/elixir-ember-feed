import Ember from 'ember';

export function helloWorld([params]) {
  return "hello world" + params;
}

export default Ember.Helper.helper(helloWorld);
