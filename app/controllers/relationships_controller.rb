class RelationshipsController < ApplicationController
   # フォローするとき
  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
  # フォロー一覧
  def followings
    @user=User.find(params[:user_id])
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    # params[:id]だとidというデータを探す処理になる
    # paramsにはidというデータはないので
    # params[:user_id]になる
    # /users/11/followings
    # params[:id]だとuser:数字まで
    @user=User.find(params[:user_id])
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
