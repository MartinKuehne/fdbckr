class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :artworks
  has_many :feedback_requests
  has_many :friendships
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
  has_one_attached :photo
  has_many :pending_friendships, -> { where status: 'pending' }, class_name: 'Friendship', foreign_key: :receiver_id

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def friends
    Friendship.where(asker: self, status: 'accepted') + Friendship.where(receiver: self, status: 'accepted')
  end

  def send_invitation(user_id)
    Friendship.create!(asker: self, receiver_id: user_id, status: 'pending')
  end

  def pending_invitations
    pending_friendships
  end

  def public_artworks
    artworks.where(privacy: false)
  end
end
