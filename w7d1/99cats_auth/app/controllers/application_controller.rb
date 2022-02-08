class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def login_user!
    @user = User.find_by_credentials(
      params[:user][:user_name], 
      params[:user][:password])

    session[:session_token] = @user.reset_session_token!
    redirect_to cats_url
  end

  def require_logged_in!
    if logged_in?
      redirect_to cats_url 
    end
  end

end
