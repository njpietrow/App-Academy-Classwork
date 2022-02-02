class UsersController < ApplicationController
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
    render json: params
  end

  def show
    users = User.find(params[:id])
    render json: users
  end
end
