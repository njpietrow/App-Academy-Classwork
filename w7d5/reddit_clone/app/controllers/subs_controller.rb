class SubsController < ApplicationController

  before_action :require_logged_in, only: [:new, :create, :edit, :update]
  before_action :is_moderator, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def is_moderator
    @sub = Sub.find_by(id: params[:id])
    if @sub.moderator.id != current_user.id
      flash[:errors] = ["You cannot edit this sub because you are not logged in as the moderator"]
      redirect_to sub_url(@sub) 
    end
  end
end
