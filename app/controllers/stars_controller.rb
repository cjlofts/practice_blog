class StarsController < ApplicationController
  before_action :authenticate_user!

  def create
    find_post
    @star = current_user.stars.new
    @star.post = @post
    respond_to do |format|
      if @star.save
        format.html { redirect_to post_path(@post), notice: "Starred!" }
        format.js { render }
      else
        format.html { redirect_to post_path(@post), notice: "Not Starred" }
        format.js { render }
      end
    end
  end

  def destroy
    find_post
    @star = current_user.stars.find params[:id]
    @star.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: "No Longer Stared" }
      format.js { render }
    end
  end

  private

  def find_post
    @post = Post.find params[:post_id]
  end

end
