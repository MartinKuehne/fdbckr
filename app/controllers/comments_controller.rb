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
    redirect_to artwork_path(@artwork)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :artwork_id, :x_offset, :y_offset)
  end
end
