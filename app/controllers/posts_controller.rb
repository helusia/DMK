class PostsController < ApplicationController
  before_action :ensure_guest_user, only: [:edit, :new]

  def new
    @post=Post.new
    @post.post_images.build
  end

  def create
    post=Post.new(post_params)
    post.user_id = current_user.id
    if
      post.save

      redirect_to posts_path

    else
        render :new
    end

  end

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post=Post.find(params[:id])
    if
      post.destroy
      redirect_to posts_path
    else
      render :show
    end

  end

  private
  # ストロングパラメータ
  def post_params
    params.require(:post).permit(:text, post_images_images: [])
  end

  def ensure_guest_user
    @user = User.find(current_user.id)
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
