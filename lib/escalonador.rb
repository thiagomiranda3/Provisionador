require 'fog'
include Math

module Escalonador
  autoload :ConnectionControl, './controllers/connection_control'
  autoload :MainControl, './controllers/main_control'
  autoload :ProvisionControl, './controllers/provision_control'
  autoload :Connection, './models/connection'
  autoload :Provision, './models/provision'
  autoload :ConnectionView, './views/connection_view'
  autoload :MainView, './views/main_view'
  autoload :ProvisionView, './views/provision_view'
end