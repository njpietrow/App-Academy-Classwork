class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity #or 422
    end
  end

  def show
    users = User.find(params[:id])
    render json: users
  end

  def update
    user = User.update(params[:id], user_params)

    if user
      render json: user
    else  
      render json: user.errors.full_messages, status: :unprocessable_entity 
    end
  end

  def destroy
    user = User.destroy(params[:id])

    if user
      render plain: "user deleted!!!"
      # redirect_to "/users"
    else
      render json: user.errors.full_messages, status: :unprocessable_entity 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
