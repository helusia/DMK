class Admin::UsersController < ApplicationController

  before_action :if_not_admin
  before_action :admin_user, only: :destroy

  def index
    @users=User.all
  end
  def show
    @user=User.find(params[:id])
    @post=@user.posts
  end

  def destroy
  User.find(params[:id]).destroy
  redirect_to users_path
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

end
