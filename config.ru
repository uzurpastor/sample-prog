# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
# add becouse problem with a delete http method 
use Rack::MethodOverride