class SessionsController < ApplicationController
  before_action :require_logged_in!
  skip_before_action :require_logged_in!, only: [:destroy]

  def new
    render :new
  end

  def create
    login_user!
  end

  def destroy
    if logged_in?
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:user_name,:password)
  end
end
