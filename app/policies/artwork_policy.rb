class ArtworkPolicy < ApplicationPolicy
attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  # def initialize
  #   @artwork = artwork
  # end

  def show?
    if @record.privacy == false || @record.user == @user
      true
    else
      array = @record.feedback_requests.select { |request| request.user == @user }
      array.any?
    end
  end
end
