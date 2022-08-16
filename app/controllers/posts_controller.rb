class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.create(params_post) 
    if @post.save
      redirect_to current_user,
        flash: { success: "Post created" }
    elsif on_current_user_page? params[:user_id]
      redirect_to current_user,
        flash: { danger: @post.errors.full_messages.join('\n') }
    else
      redirect_to login_path
    end
  end

  def destroy
    
  end

  private


    def params_post
      params.require(:post).permit(:content)      
    end
end
