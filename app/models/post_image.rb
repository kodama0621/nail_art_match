class PostImage < ApplicationRecord
  belongs_to :user
  attachment :image
end
