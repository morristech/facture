Facture.InvoicesNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('invoice', { project: @modelFor('project') })

  renderTemplate: ->
    @render('invoice.edit', {
      controller: 'invoicesNew',
      into: 'application'
    })

  setupController: (controller, model) ->
    @controllerFor('navbar').set('title', @modelFor('project').get('name'))
    controller.set('content', model)