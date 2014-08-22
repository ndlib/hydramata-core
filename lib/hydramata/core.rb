require 'hydramata/core/railtie' if defined?(Rails)

module Hydramata
  module Core
    if defined?(ActiveSupport::Autoload)
      extend ActiveSupport::Autoload
      autoload :Services
    end
  end
end
