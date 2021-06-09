class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    f_requests = Artwork.joins(:feedback_requests).where(feedback_requests: { user: current_user }, artworks: { privacy: true })
    # pictures = public_artworks && artwork where Feedbackrequest
    # exists with user_id === current_user
    # filter user_ids array for user === current user and display artwork
    public_pics = @user.public_artworks
    # shared_pics =
    @all_artworks = public_pics + f_requests
  end

  def friends
  end

  def index
    @users = User.all
  end
end
