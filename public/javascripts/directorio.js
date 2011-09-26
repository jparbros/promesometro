(function($) {
  window.Provincia = Backbone.Model.extend({})
  window.Representante = Backbone.Model.extend({})

  window.Provincias = Backbone.Collection.extend({
    model: Provincia
  });

  window.provincias = new Provincias();
  window.representante = new Representante();

  window.ProvinciaView = Backbone.View.extend({
    tagName: 'li',
    className: 'provincia',

    initialize: function() {
      this.template = _.template($('#provincia-template').html());
    },

    render: function() {
      var renderedContent = this.template(this.model.toJSON());
      $(this.el).html(renderedContent);
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
      var renderedContent = this.template(this.model.toJSON());
      $(this.el).html(renderedContent);
      return this;
    }
  });
  
  window.RepresentanteView = Backbone.View.extend({
    initialize: function() {
      _.bindAll(this,'render');
      this.model.bind('change', this.render);

      this.template = _.template($('#representante-template').html());
    },

    render: function() {
      var renderedContent = this.template(this.model.toJSON());
      $('.representante').html(renderedContent);
      return this;
    }
  });
  
  window.ProvinciasView = Backbone.View.extend({
    tagName: 'ul',
    className: 'provincias',

    initialize: function() {
      _.bindAll(this,'render');
      this.collection.bind('reset', this.render);
    },

    li_estado : function() {
      estado = new Provincia({name: this.estado});
      var view = new EstadoView({model: estado});
      $provincias.append(view.render().el);
    },

    render: function() {
      var provincias,
      collection = this.collection;

      $provincias = $(this.el);
      $provincias.html('');
      this.li_estado();
      collection.each(function(provincia){
        var view = new ProvinciaView({
          model: provincia,
          collection: collection
        });
        $provincias.append(view.render().el);
      });
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
      provincias.url = '/estados/' + estado + '/provincias';
      provincias.fetch();
      pro_vista =  new ProvinciasView({collection : provincias})
      pro_vista.estado = estado;
      $('.region').html(pro_vista.render().el)
    },

    representante: function(lugar, posicion) {
      representante.url = '/representantes/'+ lugar + '?posicion='+ posicion;
      representante.fetch();
      representanteVista = new RepresentanteView({model: representante});
    }
  });

  $(function(){
    window.App = new Directorio();
    Backbone.history.start();
  })
  })(jQuery);