class TopicsController < ApplicationController
  before_action :authenticate_user!
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
    @topic_bookmarks = Bookmark.where(topic_id: @topic.id)
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      flash[:notice] = "Topic successfully created"
      redirect_to(topics_path)
    else
      if @topic.errors
        flash.now[:alert] = "There was an error creating a topic"
        render(:new)
      end
    end
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)
    @topic.user_id = current_user.id

    if @topic.save
      flash[:notice] = "Topic successfully updated"
      redirect_to(topics_path)
    else
      if @topic.errors
        flash.now[:alert] = "There was an error updating a topic"
        render(:new)
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy && (@topic.bookmarks.count == 0)
      flash[:notice] = "Topic was successfully deleted!"
      redirect_to(topics_path)
    else
      flash.now[:alert] = "Cannot delete topic!"
      redirect_to(topics_path)
    end
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
