$env = ENV['ZSS_ENV'] || 'development'
$app_root = File.expand_path('../../', __FILE__)

require 'rubygems'

require 'bundler/setup'
Bundler.require
Bundler.require($env.to_sym)

require 'zss/service'
require './lib/settings'
require 'base_service'
require 'repositories/base'
require 'dtos/base'
require 'dtos/paginated'
require 'zss/require'
require 'zss/permit'
require 'repositories/mappers/base'

Dir['./config/initializers/**/*.rb'].each &method(:require)
Dir['./lib/*.rb'].each &method(:require)
Dir['./lib/**/*.rb'].each &method(:require)
