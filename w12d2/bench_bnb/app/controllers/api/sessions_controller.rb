class Api::SessionsController < ApplicationController
  # before_action :require_logged_out, only: :create
  # before_action :require_logged_in, only: :destroy

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password],
    )
    if @user 
      login!(@user)
      render "api/users/show"
      # redirect_to user_url(@user)
    else
      render json: ["Username or password incorrect"], status: 401
      # flash[:errors] = ["Username or password incorrect"]
      # redirect_to user_url(@user)
    end
  end

  def destroy
    logout!
    render html: "static_pages/root"
  end
end
