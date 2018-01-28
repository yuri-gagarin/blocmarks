class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save { self.role ||= :member }
  enum role: [:member, :admin]
  has_many :bookmarks, dependent: :destroy
  has_many :topics

end
