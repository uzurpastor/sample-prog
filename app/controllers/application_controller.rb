class ApplicationController < ActionController::Base
	include SessionsHelper

	skip_before_action :verify_authenticity_token unless Rails.env.production?

	private 
	
	def logged_in_user
    unless session[:user_id].present?
      store_location
      redirect_to login_url,
        flash: { danger: "Log in!" }
    end
  end
end
