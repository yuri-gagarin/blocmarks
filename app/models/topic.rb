class Topic < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  belongs_to :user
  before_save :downcase_fields

  validates :title, presence: true, uniqueness: { case_sensitive: false }


  private
  def downcase_fields
    self.title.downcase!
  end
end
