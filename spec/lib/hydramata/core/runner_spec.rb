require 'spec_fast_helper'
require 'hydramata/core/runner'

module Hydramata
  module Core

    describe Runner do
      Given(:context) { double(invoked: true) }
      Given(:runner) {
        described_class.new(context) do |on|
          on.success { |a, b| context.invoked("SUCCESS", a, b) }
          on.failure { |a, b| context.invoked("FAILURE", a, b) }
          on.other   { |a, b| context.invoked("OTHER", a, b) }
        end
      }

      Invariant { runner.context == context }

      context "#run" do
        it 'is an abstract method' do
          expect { runner.run }.to raise_error(NotImplementedError)
        end
      end

      context "calling other" do
        When(:result) { runner.callback(:other, :first, :second) }
        Then { expect(context).to have_received(:invoked).with("OTHER", :first, :second) }
        Then { result == [:first, :second] }
      end

      context "calling unknown" do
        When(:result) { runner.callback(:unknown, :first, :second) }
        Then { expect(context).to_not have_received(:invoked) }
        Then { result == [:first, :second] }
      end

    end
  end
end
