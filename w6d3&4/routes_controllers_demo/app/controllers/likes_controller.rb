class LikesController < ApplicationController
  def index
    user = User.find(params[:user_id])
    if user
      comments = user.liked_comments
      artworks = user.liked_artworks
      
      render json: comments + artworks
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  def create
    like = Like.new(like_params)

    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end
  end

  def destroy
    like = Like.destroy(params[:id])

    if like
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end
end
