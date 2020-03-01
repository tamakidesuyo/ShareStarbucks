class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id]) 
    @comment.destroy
    redirect_to post_path(@post)
  end

  private #ストロングパラメータの定義
  def comment_params
    params.require(:comment).permit(:body, :user_name, :user_id)
  end
end
