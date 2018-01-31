class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :url, presence: true
end
