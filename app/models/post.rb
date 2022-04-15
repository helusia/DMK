class Post < ApplicationRecord
  has_many :post_images, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  belongs_to :user
end
#belongs_toなどを設定するときはuser_idのカラムを投稿テーブルに追加