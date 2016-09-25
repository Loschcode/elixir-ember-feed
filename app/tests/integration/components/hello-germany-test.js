import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('hello-germany', 'Integration | Component | hello germany', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });

  this.render(hbs`{{hello-germany}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:
  this.render(hbs`
    {{#hello-germany}}
      template block text
    {{/hello-germany}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
