module Hydramata
  module Core
    class NamedCallbacks
      def initialize
        @callbacks = {}
      end

      def method_missing(callback_name, *args, &block)
        @callbacks[callback_name] = block
      end

      def respond_to_missing?(callback_name)
        @callbacks[callback_name]
      end

      def call(callback_name, *args)
        callback_name = callback_name.to_sym
        callback = @callbacks[callback_name]
        callback ? callback.call(*args) : true
      end
    end
  end
end
