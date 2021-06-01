class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :destroy]

  def index
    @artworks = Artworks.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user

    if @artwork.save
      render :show
    else
      render :new
    end
  end

  def destroy
    @artwork.destroy
    redirect_to artworks_path
  end

  private

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:restaurant).permit(:title, :description, :version, :privacy, :request, photos: [])
  end
end
