class PostsController < ApplicationController

  before_action :authenticate_user! , except: [:index]
  before_action :find_post , only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(require_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @like = @post.likes.find_by_user_id(current_user.id)
    @star = @post.stars.find_by_user_id(current_user.id)
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(require_params)
        format.html { redirect_to @post , notice: "Post Successfully Updated" }
        format.js { render :update_succcess }
      else
        format.html { render :edit }
        format.js { render :update_failure }
      end
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
    params.require(:post).permit(:title, :body, {category_ids: []})
  end

end
