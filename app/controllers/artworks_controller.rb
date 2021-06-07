class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :destroy]
  before_action :set_user_ids, only: [:create]
  # skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @comment = Comment.new
    all_artworks = Artwork.where(privacy: false).order(created_at: :desc)
    @requested_feedback_artworks = Artwork.joins(:feedback_requests).where(feedback_requests: { user: current_user }).order(created_at: :desc)
    @public_artworks = all_artworks - @requested_feedback_artworks
    @created_comment = nil
    if params[:new_comment_id]
      @created_comment = Comment.find(params[:new_comment_id])
    end
  end

  def show
    @comment = Comment.new
    @general_comments_i, @marked_comments_i = @artwork.comments.partition { |comment| comment.x_offset.nil? || comment.y_offset.nil? }
    @general_comments = @general_comments_i.sort_by!(&:created_at).reverse
    @marked_comments = @marked_comments_i.sort_by(&:created_at).reverse
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
      @user_ids&.each do |id| 
        FeedbackRequest.create(user_id: id, artwork: @artwork)
      end
      redirect_to share_path
      # artwork_path(@artwork)
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
