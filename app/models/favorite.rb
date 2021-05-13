class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image

  validates :user_id, uniqueness: { scope: :post_image_id }
end
