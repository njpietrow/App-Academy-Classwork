class AlbumsController < ApplicationController
  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else  
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else  
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.destroy
      flash[:errors] = ['Succesfully destroyed album']
      redirect_to albums_url
    else  
      flash[:errors] = ['Failed to destroyed album']
      redirect_to album_url(@album)
    end
  end

  def new
    @album = Album.new
    @id = params[:id]
    @bands = Band.all
    render :new
  end

  private
  def album_params
    params.require(:album).permit(:year, :title, :band_id, :live)
  end
end
