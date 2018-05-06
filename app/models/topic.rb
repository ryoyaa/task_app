class Topic < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  scope :find_newest_article, -> { order(created_at: :desc).limit(5) }
end
