class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :image, presence: true
  validates :caption, presence: true

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def favorited_by?(user)
    Favorites.where(user_id: user).exists?
  end

  def self.search(keyword)
    PostImage.where(['title ? OR caption LIKE ?', "%#{keyword}%", "%#{keyword}%"])
  end

end
