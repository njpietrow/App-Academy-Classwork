class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
  end

  def index
  end

  def show
  end
end
