require 'hydramata/core/railtie' if defined?(Rails)

module Hydramata
  if defined?(ActiveSupport::Autoload)
    extend ActiveSupport::Autoload
    autoload :Services
  end
  module Core
  end
end
