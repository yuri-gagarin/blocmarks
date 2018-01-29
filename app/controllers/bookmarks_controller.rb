class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    @user = current_user
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(bookmark_params)
    @bookmark.user_id = current_user.id

    if @bookmark.save!
      flash[:notice] = "Bookmark Was Saved"
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error creating a Bookmark"
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save!
      flash[:notice] = "Bookmark Was Updated"
      redirect_to @topic
    else
      flash.now[:alert] = "Server Error. Bookmark not Updated"
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy!
      flash[:notice] = "Bookmark was deleted"
      redirect_to action: :index
    else
      flash.now[:error] = "Error in deleting the bookmark"
      render :index
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url, :description)
  end
end
