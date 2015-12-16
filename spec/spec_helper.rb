$env = ENV['ZSS_ENV'] ||= 'test'

require_relative '../config/boot'

Dir['./spec/support/**/*.rb'].each &method(:require)
