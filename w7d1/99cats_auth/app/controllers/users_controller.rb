class UsersController < ApplicationController
  before_action :redirect_logged_in
  skip_before_action :redirect_logged_in, only: [:redirect_logged_in]

  def new
    @user = User.new()
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!
    else
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name,:password)
  end
end
