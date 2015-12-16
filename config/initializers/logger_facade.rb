if Settings.logging["console"].present?
  plugin = LoggerFacade::Plugins::Console.new({ level: Settings.logging.console.level })
  LoggerFacade::Manager.use(plugin)
end

if Settings.logging["logstash"].present?
  plugin = LoggerFacade::Plugins::Logstash.new(Settings.logging.logstash)
  LoggerFacade::Manager.use(plugin)
end

if Settings.logging["airbrake"].present?
  plugin = LoggerFacade::Plugins::Airbrake.new($env)

  plugin.configure do |config|
    config.api_key = Settings.logging.airbrake.api_key
    config.host    = Settings.logging.airbrake.host
    config.port    = Settings.logging.airbrake.port
    config.secure  = config.port == 443
  end

  LoggerFacade::Manager.use(plugin)
end
