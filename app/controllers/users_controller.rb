class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :index,          only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new 
  end

  def index
    @users = User.page(params[:page]) #(page: params[:page], per_page: 10)
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
    @user = User.new user_form
    if @user.save
      check_remember
      log_in  @user
      flash[:success] = "welcome to my app!" 
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update    
    @user = User.find params[:id] 
    if @user.update(user_form)
      flash[:success] = "Profile upload!" # unless user_before == @user
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
    def logged_in_user
      unless session[:user_id].present?
        store_location
        flash[:danger]  = "Log in!"
        redirect_to login_url
      end
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

    def user_form
      params.require(:user).permit( :name, 
                                    :email, 
                                    :password, 
                                    :password_confirmation )
    end 
end


