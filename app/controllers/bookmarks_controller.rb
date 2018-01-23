class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def new
    @bookmark = Bookmark.new
    @user = current_user
    puts "current user id is " + @user.id.to_s
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.topic_id = 1
    @bookmark.user_id = current_user.id

    if @bookmark.save!
      puts @bookmark
      puts "bookmark was saved"
    else
      puts "error"
    end
  end

  def update
  end

  def destroy
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url, :description)
  end
end
