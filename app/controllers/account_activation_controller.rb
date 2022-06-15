class AccountActivationController < ApplicationController
	def edit
    email_activation = EmailActivation.find(params[:id])

    user = User.find(email_activation.user_id)

    unless email_activation.varificated
      flash[:notice] = "some error"
      redirect_to user
    end
    if current_user? user 
      flash[:success] = "Successfully email activated"
      redirect_to user
    else
      redirect_to login_path
    end


  end
end
