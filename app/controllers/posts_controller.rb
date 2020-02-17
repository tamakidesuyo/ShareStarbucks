class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: 'desc')
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    # @post = Post.create(params.require(:post).permit(:title, :body))
    @post = Post.new(post_params)
    @post.save

    if @post.save
      redirect_to root_path
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
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :body) 
    end
end