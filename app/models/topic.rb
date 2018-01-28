class Topic < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  before_validation :regulate_title
  validates :title, presence: true, uniqueness: { case_sensitive: false }


  private

  #strip and downcase the title 
  def regulate_title
    self.title = self.title.strip
    self.title.downcase!
  end
end
