class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:accept, :decline]

  def create
    current_user.send_invitation(params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def accept
    @friendship.accept!
    redirect_to friends_path(@friendship.receiver_id)
  end

  def decline
    @friendship.decline!
    redirect_to friends_path(@friendship.receiver_id)
  end

  private

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
