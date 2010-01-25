gem 'rack-test', '>=0.5.0'
gem 'sinatra', '>=0.9.4'

require 'spork'

Spork.prefork do
  require 'spec/expectations'
  require 'rack/test'
  require 'webrat'
  require 'database_cleaner'
  
  app_file = File.join(File.dirname(__FILE__), '../../app.rb')
  require app_file

  Sinatra::Application.app_file = app_file

  Webrat.configure do |config|
    config.mode =  :rack
  end

  class MyWorld
    include Rack::Test::Methods
    include Webrat::Methods
    include Webrat::Matchers

    def app
      Sinatra::Application
    end
  end

#  World { MyWorld.new } 
#  DatabaseCleaner.strategy = :truncation
end

Spork.each_run do

  World { MyWorld.new } 

  Before do
#    DatabaseCleaner.clean
  end
end

at_exit do
#  DatabaseCleaner.clean
end
