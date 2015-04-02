class PostsController < ApplicationController

  before_action :find_post , only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(require_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(require_params)
      redirect_to @post , notice: "Post Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def require_params
    params.require(:post).permit(:title, :body)
  end

end
