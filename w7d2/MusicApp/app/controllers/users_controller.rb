class UsersController < ApplicationController

  before_action :require_log_out?, only: [:new, :create]
  before_action :require_log_in?, only: [:destroy]

  def index
    @users = User.all
    render :index
  end
  
  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def destroy

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
