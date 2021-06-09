class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @artwork = Artwork.find(params[:artwork_id])
    @comment.artwork = @artwork
    @comment.user = current_user
    @comment.save
    if params[:coming_from] == "show"
      redirect_to @artwork
    else
      redirect_to root_path(@artwork, new_comment_id: @comment.id, anchor: "artwork-image-#{@artwork.id}")
    end
  end

  def create_index
    @comment = Comment.new(comment_params)
    @artwork = Artwork.find(params[:artwork_id])
    @comment.artwork = @artwork
    @comment.user = current_user
    @comment.save
    redirect_to root_path(@artwork, new_comment_id: @comment.id, anchor: "artwork-image-#{@artwork.id}")
  end

  def card
    @comment = Comment.find(params[:id])
    render partial: 'artworks/popover_comment', locals: { comment: @comment }
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :artwork_id, :x_offset, :y_offset)
  end
end
