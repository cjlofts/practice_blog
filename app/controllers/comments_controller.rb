class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_post , only: [:create, :edit, :update, :destroy]
  before_action :find_comment , only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post), notice: "Comment Created!" }
        format.js { render :create_success }
      else
        format.html { render "posts/show" }
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "Comment Deleted!" }
      format.js { render }
    end
  end

  def edit
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to @post , notice: "Comment Successfully Updated"
    else
      render :edit
    end
  end

  private

  def find_comment
    @comment = Comment.find params[:id]
  end

  def find_post
    @post = Post.find params[:post_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
