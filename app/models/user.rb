class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, {length: {maximum: 150}}

  has_many :posts
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  #accepts_attachments_for :post_images,
  attachment :image
  has_many :favorites, dependent: :destroy
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end

    def self.guest
      find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
        user.password = SecureRandom.urlsafe_base64
        user.name = "guestuser"
      end
    end

end
