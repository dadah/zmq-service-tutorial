require_relative 'config/boot'
Bundler.require
Dir["./tasks/*.rb"].each {|file| require file }

def postgres_conf
  postgres_conf = Settings.database.clone
  postgres_conf[:database] = 'postgres'
  postgres_conf
end

namespace :db do
  desc 'Create database'
  task :create do
    ActiveRecord::Base.establish_connection postgres_conf
    ActiveRecord::Base.connection.create_database Settings.database.database
  end

  task :drop do
    ActiveRecord::Base.establish_connection postgres_conf
    ActiveRecord::Base.connection.drop_database Settings.database.database
  end

  desc 'Run db migrations'
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate', ENV['VERSION'].presence.try(:to_i))
  end

  desc 'Run db rollback'
  task :rollback do
    ActiveRecord::Migrator.down('db/migrate', ENV['VERSION'].presence.try(:to_i))
  end
end

namespace :service do

  desc 'Run console'
  task :console do
    pry
  end

end
