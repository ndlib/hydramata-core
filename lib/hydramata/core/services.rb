require 'active_support/lazy_load_hooks'
module Hydramata
  module Core
    class Services
    end
    ActiveSupport.run_load_hooks(:hydramata_core_services, Services)
  end
end