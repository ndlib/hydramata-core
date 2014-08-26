require 'active_support/lazy_load_hooks'
require 'hydramata/exceptions'
module Hydramata
  class Configuration
    def translator
      @translator ||= begin
        require 'hydramata/core/translator'
        Core::Translator.new(base_scope: ['hydramata', 'core'])
      end
    end
    def translator=(object)
      raise ConfigurationError.new("Expected #{self.class}#translator to respond_to #translate. #{object.inspect} does not respond to #translate") unless object.respond_to?(:translate)
      @translator = object
    end
  end
  ActiveSupport.run_load_hooks(:hydramata_configuration, Configuration)
end
