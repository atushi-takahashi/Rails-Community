class PostsController < ApplicationController
  
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  # def index
  #   @posts = Post.all
  # end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      render :new 
    end
  end

  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to root_path, notice: "更新に成功しました"
    else
      render :edit
    end
  end
  
  def destroy
    if @post.destroy(post_params)
      redirect_to root_path, notice: "削除に成功しました"
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
  
  def find_post 
    @post = Post.find(params[:id])
  end

end