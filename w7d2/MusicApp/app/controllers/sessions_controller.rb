class SessionsController < ApplicationController

  before_action :require_log_out?, only: [:new, :create]
  before_action :require_log_in?, only: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
                                     params[:user][:email],
                                     params[:user][:password]
                                    )
    if @user.nil?
      @user = User.new(email: params[:user][:email])
      flash.now[:errors] = ['Invalid Login Credentials, idiot']
      render :new
    else
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    user = current_user
    logout!(user)
    redirect_to new_session_url
  end

end
