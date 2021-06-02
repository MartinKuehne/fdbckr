class Artwork < ApplicationRecord
  belongs_to :user
  has_many :feedback_requests
  has_many :comments, dependent: :destroy
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 10 }
end
