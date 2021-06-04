class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :artworks
  has_many :feedback_requests
  has_many :friendships_as_asker, class_name: "Friendship", foreign_key: :asker_id
  has_many :friendships_as_receiver, class_name: "Friendship", foreign_key: :receiver_id
  has_one_attached :photo

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def friends
    users_as_asker = friendships_as_asker.map { |friend| friend.receiver }
    users_as_receiver = friendships_as_receiver.map { |friend| friend.asker }
    users_as_asker + users_as_receiver
  end
end
