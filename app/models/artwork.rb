class Artwork < ApplicationRecord
  belongs_to :user
  has_many :feedback_requests
  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 50 }
end
