class SessionsController < ApplicationController

  def new
    SessionsController.new()
  end

  def create
    user = User.find_by_email params_session[:email]
    if user && user.authenticate(params_session[:password])
      log_in_and_remember user, params: params_session
      redirect_back_or user
    else
      flash.now[:danger] =  'Invalid email or password' 
      render 'new', 
        status: :unprocessable_entity 
    end
  end

  def destroy
    log_out if logged?
    redirect_to home_path
  end

  private

  def params_session
    params.require(:session)
      .permit(
        :email, 
        :password, 
        :remember_me )
  end
end
