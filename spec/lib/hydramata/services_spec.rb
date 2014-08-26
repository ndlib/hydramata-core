require 'spec_fast_helper'
require 'active_support/lazy_load_hooks'
module Hydramata
  class Services
  end

  module MockServices
  end

  describe 'Services' do
    it 'allows loading of additional modules' do
      expect do
        ActiveSupport.on_load(:hydramata_services) do
          include MockServices
        end
        require 'hydramata/services'
      end.to change { Services.included_modules.include?(MockServices) }.from(false).to(true)
    end
  end
end
