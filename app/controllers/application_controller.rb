class ApplicationController < ActionController::Base
	include SessionsHelper

	skip_before_action :verify_authenticity_token unless Rails.env.production?
end
