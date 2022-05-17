class Post < ApplicationRecord
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  accepts_attachments_for :post_images, attachment: :image
  belongs_to :user
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("text LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("text LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("text LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("text LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end

end
#belongs_toなどを設定するときはuser_idのカラムを投稿テーブルに追加