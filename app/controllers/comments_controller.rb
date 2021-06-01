class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :artwork_id, :x_offset, :y_offset)
  end
end
