class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
  validates :caption, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
