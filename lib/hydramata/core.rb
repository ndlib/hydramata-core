require 'hydramata/core/railtie' if defined?(Rails)

module Hydramata
  if defined?(ActiveSupport::Autoload)
    extend ActiveSupport::Autoload
    autoload :Services
    autoload :Configuration
  end
  class << self
    attr_writer :configuration

    # @see Configuration
    def configuration
      require 'hydramata/configuration'
      @configuration ||= Configuration.new
    end
  end

  module_function

  # @see Configuration
  # @see .configuration
  def configure
    yield(configuration)
  end

  module Core
  end
end
