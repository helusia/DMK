class UsersController < ApplicationController
    before_action :authenticate_user!

    before_action :ensure_guest_user, only: [:edit]
  def index
    @users=User.all
  end
  def show
    @user=User.find(params[:id])
    @post=@user.posts
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def favorites
      @user = User.find(params[:id])
      favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
      @favorite_posts = Post.find(favorites)
  end

  def destroy
  user = User.find(params[:id])
  user.destroy
  redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)#post_images_images: []
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end