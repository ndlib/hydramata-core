require 'active_support/lazy_load_hooks'
require 'active_support/dependencies/autoload'
module Hydramata
  module Core
    extend ActiveSupport::Autoload
    autoload :Services
    class Services
    end
    ActiveSupport.run_load_hooks(:hydramata_core_services, Services)
  end
end