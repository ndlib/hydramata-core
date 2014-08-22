require 'spec_fast_helper'
require 'hydramata/core/named_callbacks'

module Hydramata
  module Core
    describe NamedCallbacks do
      Given(:named_callback) { described_class.new }
      Given(:context) { [ ] }
      Given { named_callback.my_named_callback { |*a| context.replace(a) } }

      describe "with a named callback" do
        Given(:callback_name) { :my_named_callback }
        When { named_callback.call(callback_name, 'a',:hello) }
        Then { context == ['a', :hello] }
      end

      describe "with a named callback called by a string" do
        Given(:callback_name) { 'my_named_callback' }
        When { named_callback.call(callback_name, 'a',:hello) }
        Then { context == ['a', :hello] }
      end

      describe "with a undeclared callback" do
        When(:result) { named_callback.call(:undeclared_callback, 1, 2, 3) }
        Then { result }
        Then { context == [] }
      end
    end
  end
end
