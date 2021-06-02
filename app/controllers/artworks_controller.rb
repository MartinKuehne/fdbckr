# 1. if CURRENT USER has been given permission to view an ARTWORK, run iteration:
#     show all artworks WHERE current user exists ORDER BY upload_time DESC
# 2. Run iteration:
#     show all artworks WHERE privacy = false ORDER BY upload_time DESC



class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :destroy]
  # skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @comment = Comment.new
    all_artworks = Artwork.where(privacy: false).order(created_at: :desc)
    @requested_feedback_artworks = Artwork.joins(:feedback_requests).where(feedback_requests: { user: current_user }).order(created_at: :desc)
    @public_artworks = all_artworks - @requested_feedback_artworks
  end

  def show
    @comment = Comment.new

    @general_comments = @artwork.comments.map do |comment|
      comment if comment.x_offset.nil? && comment.y_offset.nil?
    end

    @marked_comments = @artwork.comments.map do |comment|
      comment unless comment.x_offset.nil? || comment.y_offset.nil?
    end
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
