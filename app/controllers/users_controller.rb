class UsersController < ApplicationController

  def new
    @user = User.new 
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
      flash[:success] = "welcome to my app!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity

    end
  end
  private

    def user_form
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end


