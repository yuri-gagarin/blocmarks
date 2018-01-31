class LikesController < ApplicationController

  def new
    @topic_id = params[:topic_id]
    redirect_to topic_path(id: @topic_id)
  end

  def create
    @like = Like.new(like_params)
    @topic_id = params[:topic_id]
    if @like.save!
      flash[:notice] = "Bookmark liked"
      redirect_to topic_path(id: @topic_id)
    else
      flash.now[:alert] = "Error in saving like"
      redirect_to topic_path(id: @topic_id)
    end
  end

  def destroy

  end

  private
  def like_params
    params.permit(:user_id, :bookmark_id)
  end

end
