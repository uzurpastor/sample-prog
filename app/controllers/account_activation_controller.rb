class AccountActivationController < ApplicationController
	def edit
    email_activation = EmailActivation.find(params[:id])

    user = User.find(email_activation.user_id)

    unless email_activation.varificated
      redirect_to user,
        flash: { notice: "some error" }
    end
    if current_user? user 
      redirect_to user,
        flash: { success: "Successfully email activated" }
    else
      redirect_to login_path
    end


  end
end
