require 'spec_fast_helper'
require 'active_support/lazy_load_hooks'

module Hydramata
  class Configuration
  end

  module MockConfiguration
  end

  describe 'Configuration' do
    it 'allows loading of additional modules' do
      expect do
        ActiveSupport.on_load(:hydramata_configuration) do
          include MockConfiguration
        end
        require 'hydramata/configuration'
      end.to change { Configuration.included_modules.include?(MockConfiguration) }.from(false).to(true)
    end

    context '#translator' do
      subject { Configuration.new }
      it 'defaults to something that will translate' do
        expect(subject.translator).to respond_to(:translate)
      end
      it 'can be overridden by something that will translate' do
        new_translator = double(translate: true)
        expect { subject.translator = new_translator }.
          to change { subject.translator }.
          to(new_translator)
      end
      it 'requires a translator to have the proper methods' do
        new_translator = double
        expect { subject.translator = new_translator }.to raise_error
      end
    end
  end
end
