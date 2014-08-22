require 'rails/railtie'

module Hydramata
  module Core
    class Railtie < Rails::Railtie
      config.eager_load_namespaces << Hydramata::Core
    end
  end
end
