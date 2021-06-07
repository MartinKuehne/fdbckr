class Friendship < ApplicationRecord
  belongs_to :asker, class_name: "User"
  belongs_to :receiver, class_name: "User"
  validates :asker, uniqueness: { scope: :receiver }

  def self.find_invitation(asker, receiver)
    Friendship.find_by(akser: asker, receiver: receiver)
  end

  def accept!
    self.status = 'accepted'
    save
  end

  def decline!
    self.status = 'declined'
    save
  end
end
