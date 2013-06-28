ENV['RACK_ENV'] = 'test'
ENV['DATABASE_URL'] = ENV['DATABASE_TEST_URL']
require 'rack/test'

require './app/models/diogo'


Bundler.setup
Bundler.require(:default, :test)

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end


