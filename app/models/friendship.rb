class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates :asker, uniqueness: {scope: :receiver }

  def self.find_invitation(asker, receiver)
    Friendship.where(akser: asker, receiver: receiver)
  end
end
