class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_post , only: [:create, :edit, :update, :destroy]
  before_action :find_comment , only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post), notice: "Comment Created!"
    else
      render "posts/show"
    end
  end


  def destroy
    @comment.delete
    redirect_to post_path(@post), notice: "Comment Deleted!"
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


