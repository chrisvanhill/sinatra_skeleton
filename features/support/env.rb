require 'rubygems'
require 'spork'
require 'database_cleaner'

Spork.prefork do
#  DatabaseCleaner.strategy = :truncation
end

Spork.each_run do
  Before do
#    DatabaseCleaner.clean
  end
end

at_exit do
#  DatabaseCleaner.clean
end
