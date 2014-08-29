require 'active_support/core_ext/array/wrap'

module Hydramata
  module Core
    # Responsible for handling the translation via diminishing specificity.
    class Translator

      class << self
        def translate(key, options = {})
          new(options).translate(key, options)
        end
        alias_method :t, :translate
      end

      attr_reader :base_scope, :translation_service, :translation_service_error
      def initialize(options = {})
        self.base_scope = options.fetch(:base_scope) { default_base_scope }
        @translation_service = options.fetch(:translation_service) { default_translation_service }
        @translation_service_error = options.fetch(:translation_service_error) { default_translation_service_error }
      end

      def translate(key, options = {})
        translate_key_for_specific_scopes(key, options) || translate_key_for_general_case(key, options)
      end
      alias_method :t, :translate

      private

      def translate_key_for_specific_scopes(key, options = {})
        return nil unless scopes = options[:scopes]
        returning_value = nil
        Array.wrap(scopes).each do |scope|
          begin
            options_to_use = options.merge(scope: base_scope + Array.wrap(scope), raise: true)
            options_to_use.delete(:scopes)
            options_to_use.delete(:default)
            returning_value = translation_service.translate(key, options_to_use)
            break
          rescue *translation_service_error => e
            STDOUT.puts(e) if ENV['DEBUG_TRANSLATIONS']
            next
          end
        end
        returning_value
      end

      def translate_key_for_general_case(key, options = {})
        options_to_use = options.merge(scope: base_scope)
        options_to_use.delete(:scopes)
        translation_service.translate(key, options_to_use)
      end

      def base_scope=(values)
        @base_scope = Array.wrap(values)
      end

      def default_base_scope
        ['hydramata', 'core']
      end

      def default_translation_service_error
        require 'i18n/exceptions'
        I18n::ArgumentError
      end

      def default_translation_service
        require 'i18n'
        I18n
      end
    end
  end
end
