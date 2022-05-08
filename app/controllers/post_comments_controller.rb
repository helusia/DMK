class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id

    @comment.post_id = @post.id
    @comment.save!
    redirect_to post_path(@post.id)
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    # 「主キー(id)以外のカラムを指定しても、見つかった1レコードを返せる」だそう。
    #post_commentモデルは、自身の主キーであるidと、外部キーとしてbook_idを持ってるわけで、
    #両方消すから、両方のid持ってきてるってことでしょうか。
    # どゆこと？
    redirect_to post_path(params[:post_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
