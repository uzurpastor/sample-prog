class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :index,          only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new 
  end

  def index
    @users = User.page(params[:page]) 
  end

  def show
    begin
      record = User.find params[:id]
      @user = record
    rescue ActiveRecord::RecordNotFound => e
      redirect_to "/sign" 
    end
  end

  def create 
    @user = User.new params_user
    if @user.save
      check_remember
      log_in  @user
      TechnicalMailer.account_activation(@user).deliver_later
      redirect_to user_path(@user), 
        layout: "users/show",
        action: :show,
        status: :created, 
        flash: { success: flash_text }
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find_by_id params[:id]
      redirect_to login_path unless current_user
  end

  def update    
    @user = User.find params[:id] 
    if @user.update(params_user_for_edit)
      redirect_to @user,
        flash: { success: "Profile upload!" }
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:success] = "User #{user.name} deleted (#{user.email})"
    redirect_to users_path
  end

  private

    def flash_text
      success_text = unless use_gmail?
        "Verificate your email"
      else
        "You cant verifycate. #{view_context.link_to 'More info', 'https://www.spamhaus.org/query/bl?ip=92.113.180.5'}"
      end
      "Welcome to my app!\n#{success_text}"
    end

    def logged_in_user
      unless session[:user_id].present?
        store_location
        redirect_to login_url,
          flash: { danger: "Log in!" }
      end
    end

    def use_gmail?
      @user.email.include? 'gmail'
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to home_path unless current_user?(@user)
    end

    def check_remember
      remember_digest = params.require(:user).permit(:remember_digest)
      case remember_digest 
      when '1' then remember(@user)
      when '0' then @user.remember_digest = nil  
      end
    end

    def params_user
      params.require(:user)
        .permit( 
          :name, 
          :email, 
          :password, 
          :password_confirmation )
    end 

    def params_user_for_edit
      params.require(:user)
        .permit( 
          :name, 
          :email,
          :avatar )
    end 

end


