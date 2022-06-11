ActiveAdmin.register User do

  permit_params :id, :name, :email, :password, :password_confirmation


  index do 
    selectable_column
    id_column
    column :name
    column :email
    # column "" do |user|
    #   link_to "Delete", admin_users_destroy_path(user), method: :delete
    # end
    # column "" do |user|
    #   link_to "View", admin_user_path(user)
    # end
    actions
  end

  # show :all, exept: [:remember_digest]

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
  # have the custom destroy action
  actions :all, except: [:edit] 
  # do
  #   link_to "Delete", admin_users_destroy_path(user)
  # end

  # controller do
  #   def create
  #     @user = User.create(permitted_params[:user])
  #     if @user.save
  #       redirect_to :admin_users
  #     else
  #       flash[:danger] = @user.errors.full_messages
  #       redirect_to :new_admin_user
  #     end
  #   end

  #   def destroy 
  #     User.find(permitted_params[:id]).destroy
  #     redirect_to :admin_users
  #   end
  # end


end
