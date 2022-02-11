class PostsController < ApplicationController
  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def new
    @post = Post.new
    @sub = Sub.find_by(id: params[:sub_id])
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
