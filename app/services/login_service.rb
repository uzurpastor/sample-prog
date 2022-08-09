class LoginService
  class << self

    def create_new_session_and_remember user, params:
      log_in user
      params[:remember_me] == '1' ? remember(user) : forget(user)
    end

    def log_in user
      session[:user_id] = user.id
    end

    def remember user
      user.remember CrypterService.digest_from_new_token
      cookies.permanent.signed[:user_id] = user.id
      cookies.permanent[:remember_token] = user.remember_token
    end
    def forget user
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
    end
  end
end