#\ -p 8080
require File.join(File.dirname(__FILE__), 'sample_location_server.rb')
run Sinatra::Application
