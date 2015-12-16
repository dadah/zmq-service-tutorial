require 'settingslogic'

class Settings < ::Settingslogic
  source 'config/application.yml'
  namespace $env
  load!
end
