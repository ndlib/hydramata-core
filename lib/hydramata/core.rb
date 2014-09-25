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
  def configure(&block)
    @configuration_block = block

    # The Rails load sequence means that some of the configured Targets may
    # not be loaded; As such I am not calling configure! instead relying on
    # Hydra::RemoteIdentifier::Railtie to handle the configure! call
    configure! unless defined?(Rails)
  end

  def configure!
    if @configuration_block.respond_to?(:call)
      self.configuration ||= Configuration.new
      @configuration_block.call(configuration)
      @configuration_block = nil
    end
  end
  private :configure!

  module Core
  end
end
