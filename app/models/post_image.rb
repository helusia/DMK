class PostImage < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :post
  attachment :image
end
