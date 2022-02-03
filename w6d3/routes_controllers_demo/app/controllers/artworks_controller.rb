class ArtworksController < ApplicationController
  def index
    # render json: params
    user = User.find(params[:user_id])
    if user
      artworks = user.artworks
      artworks2 = user.shared_artworks

      render json: artworks + artworks2
    else
      render json: user.errors.full_messages, status: 404
    end
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.update(params[:id], artwork_params)

    if artwork
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.destroy(params[:id])

    if artwork
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
