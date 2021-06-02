class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :destroy]

  def index
    @artworks = Artwork.all
  end

  def show
    @comment = Comment.new
    @general_comments, @marked_comments = @artwork.comments.partition { |comment| comment.x_offset.nil? || comment.y_offset.nil? }
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user

    if @artwork.save
      redirect_to artwork_path(@artwork)
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
    params.require(:artwork).permit(:title, :description, :version, :privacy, :request, photos: [])
  end
end
