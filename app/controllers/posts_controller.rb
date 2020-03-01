class PostsController < ApplicationController
  before_action :authenticate_user! #ログイン済みのユーザーのみにアクセス許可(deviseのヘルパー) (参照：https://qiita.com/tobita0000/items/866de191635e6d74e392)

  def home
    @posts = Post.all.order(created_at: 'desc')
    # @posts = Post.where(user_id: 4)
    @users = User.all.order(:id) #idの昇順でユーザーのデータを取得
  end

  def index
    # @posts = Post.all.order(created_at: 'desc')
    @posts = current_user.posts.all.order(created_at: 'desc') #ログインユーザーの投稿のみを取得
    gon.posts = @posts
  end

  def show
    # @post = current_user.posts.find(params[:id]) #ログインユーザーの投稿のみから探す
    @post = Post.find(params[:id])
    gon.post = @post
  end

  def new
    @post = Post.new
    @name = params[:name] #@nameにindexの店舗名を代入
    
  end

  def create
    # render plain: params[:post].inspect
    # @post = Post.create(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)
    @post.save

    if @post.save
      redirect_to posts_path
    else
      # render plain: @post.errors.inspect
      render 'new'
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  #ストロングパラメータを定義
  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id, :img, :remove_img) 
    end
end
