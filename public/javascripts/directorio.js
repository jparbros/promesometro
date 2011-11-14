(function($) {
  window.Provincia = Backbone.Model.extend({})
  
  window.Representante = Backbone.Model.extend({})

  window.ProvinciasList = Backbone.Collection.extend({
    model: Provincia,
    state: undefined,
    url: function() {
      return '/estados/' + this.state + '/provincias';
    }
  });

  window.Provincias = new ProvinciasList();

  window.ProvinciaView = Backbone.View.extend({
    tagName: 'li',
    className: 'provincia',

    initialize: function() {
      this.template = _.template($('#provincia-template').html());
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    }
  });
  
  window.EstadoView = Backbone.View.extend({
    tagName: 'li',
    className: 'provincia estado',
    
    initialize: function() {
      this.template = _.template($('#estado-template').html());
    },

    render: function() {
      $(this.el).html(this.template(this.model.toJSON()));
      return this;
    }
  });
  
  window.RepresentanteView = Backbone.View.extend({

    initialize: function() {
      this.template = _.template($('#representante-template').html());
      _.bindAll(this,'render');
      this.model.bind('change', this.render);
    },

    render: function() {
      $('.representante').html(this.template(this.model.toJSON()));
      return this;
    }
  });
  
  window.ProvinciasListView = Backbone.View.extend({
    tagName: 'ul',
    className: 'provincias',

    initialize: function() {
      _.bindAll(this,'render');
      this.collection.bind('reset', this.render);
    },

    addState : function() {
      stateModel = new Provincia({name: this.state});
      var stateView = new EstadoView({model: stateModel});
      $(this.el).append(stateView.render().el);
    },

    render: function() {
      this.addState();
      this.collection.each(function(provincia) {
        var view = new ProvinciaView({ model: provincia, collection: this.collection });
        if(_.include(['cusco','san martin','chiclayo'], provincia.get('name'))) {
          $(view.render().el).addClass('underline');
        }
        $(this.el).append(view.el);
      });
      $('.region').html(this.el)
      return this;
    }    
  });

  window.Directorio = Backbone.Router.extend({
    routes: {
      ':estado/provincias' : 'provincias',
      'representante/:lugar/:posicion' : 'representante'
    },

    initialize: function() {
    },

    provincias: function(estado) {
      Provincias.state = estado;
      pro_vista =  new ProvinciasListView({collection : Provincias})
      pro_vista.state = estado;
      Provincias.fetch();
    },

    representante: function(lugar, posicion) {
      representante = new Representante();
      representante.url = '/representantes/'+ lugar + '?posicion='+ posicion;
      representante.fetch();
      representanteVista = new RepresentanteView({model: representante});
      if(representante.get('name') == undefined) {
         $('.representante').html('La información no se enuentra disponible');
      }
    }
  });

  $(function(){
    window.App = new Directorio();
    Backbone.history.start();
  })
  })(jQuery);