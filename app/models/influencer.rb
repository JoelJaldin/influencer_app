class Influencer < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :platform, presence: true
  validates :followers, presence: true
  validates :profile_url, presence: true
end
