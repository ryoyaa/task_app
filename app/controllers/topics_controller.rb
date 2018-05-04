class TopicsController < ApplicationController
  before_action :set_topic, only: [ :show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
