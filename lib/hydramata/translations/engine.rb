module Hydramata
  module Translations
    # Hydramata::Translations is a [Rails::Engine](http://guides.rubyonrails.org/engines.html)
    #
    # These are the pieces necessary for coordinating the Hydramata::Translations with
    # your instance of a Rails application.
    class Engine < ::Rails::Engine
      engine_name 'hydramata_translations'

      if config.respond_to?(:eager_load_namespaces)
        # SimpleForm did this, so I'm thinking that I will do it.
        config.eager_load_namespaces << Hydramata::Translations
      end

      initializer 'hydramata_translations.initializers' do |app|
        app.config.paths.add 'app/forms', eager_load: true
        app.config.paths.add 'app/persisters', eager_load: true
        app.config.paths.add 'app/presenters', eager_load: true
        app.config.paths.add 'app/parsers', eager_load: true
        app.config.paths.add 'app/services', eager_load: true
        app.config.autoload_paths += %W(
          #{config.root}/app/forms
          #{config.root}/app/persisters
          #{config.root}/app/presenters
          #{config.root}/app/parsers
          #{config.root}/app/services
        )
      end
    end
  end
end
