class ApplicationController < ActionController::Base
	include SessionsHelper

	skip_before_action :verify_authenticity_token if Rails.env.test?
end
