class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:member, :admin]

  validates :user_name, presence: true, uniqueness: true

  before_save { self.role ||= :member }
  has_many :bookmarks, dependent: :destroy
  has_many :topics

end
