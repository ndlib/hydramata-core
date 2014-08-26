require 'active_support/lazy_load_hooks'
require 'active_support/dependencies/autoload'
module Hydramata
  # The Services class is a dumping ground for methods. These methods are
  # exposed to an application's context (i.e. a controller).
  #
  # It is the application's interface between the logic of the controller/
  # request handling and the construction of objects.
  #
  # This class has been constructed such that other engines can inject
  # behavior into Services using the ActiveSupport.on_load method.
  #
  # @see Runner
  class Services
  end
  ActiveSupport.run_load_hooks(:hydramata_services, Services)
end
