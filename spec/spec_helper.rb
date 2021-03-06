require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'
require 'spork'
require 'database_cleaner'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

Spork.prefork do
#  DatabaseCleaner.strategy = :truncation
end
