class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :destroy]
  before_action :set_user_ids, only: [:create]

  def index
    @artworks = Artwork.all
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
    # setting the version to 1; how can we change the code if we want to implement later versions?
    @artwork.version = 1
    if @artwork.save
      @user_ids.each do |id| 
        FeedbackRequest.create(user_id: id, artwork: @artwork)
      end
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

  def set_user_ids
    @user_ids = params[:artwork][:user_id]
  end

  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(:title, :description, :version, :privacy, :request, photos: [])
  end
end
