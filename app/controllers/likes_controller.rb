class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    find_post
    @like = current_user.likes.new
    @like.post = @post
    respond_to do |format|
      if @like.save
        format.html { redirect_to post_path(@post), notice: "Liked!" }
        format.js { render }
      else
        format.html { redirect_to post_path(@post), notice: "Not Liked" }
        format.js { render }
      end
    end
  end

  def destroy
    find_post
    @like = current_user.likes.find params[:id]
    @like.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "No Longer Liked" }
      format.js { render }
    end
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end

end
