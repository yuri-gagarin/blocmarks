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
  end

  def destroy
  end

  def topic_params
    params.require(:topic).permit(:title)
  end
end
