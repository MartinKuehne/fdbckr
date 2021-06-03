class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
  end

  def brandguidelines
    @comment = Comment.new
    @artwork = Artwork.find(1)
  end

  def landing
    @user = User.new
  end
end
