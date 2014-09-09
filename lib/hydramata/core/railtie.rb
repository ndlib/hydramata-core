require 'rails/railtie'

module Hydramata
  module Core
    class Railtie < Rails::Railtie
      config.eager_load_namespaces << Hydramata::Core
      config.to_prepare do
        # Because I want allow for other components to plug into Hydramata's
        # configuration. Maybe there is a better way to do this.
        Hydramata.send(:configure!)
      end
    end
  end
end
