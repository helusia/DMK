class UsersController < ApplicationController
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

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)#post_images_images: []
  end

end