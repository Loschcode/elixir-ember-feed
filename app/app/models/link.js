import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  description: DS.attr('string'),
  url: DS.attr('string'),
  source: DS.attr('string'),
  published_at: DS.attr('date'),
  inserted_at: DS.attr('date'),
  created_at: DS.attr('date')
});
