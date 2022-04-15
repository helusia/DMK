class PostsController < ApplicationController

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
end
