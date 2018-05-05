class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_topic, only: [ :show, :edit, :update, :destroy]

  def index
    @q = Topic.ransack(params[:q])
    @topics = @q.result.page(params[:page]).per(8)
    if user_signed_in?
      @user = current_user
      @new_topics = @user.topics.order(created_at: :desc).limit(5)
    end
  end

  def show
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
      if @topic.save
        redirect_to topics_path, notice: "投稿に成功しました"
      else
        flash.now[:alert] = "投稿に失敗しました"
        render :new
      end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path, notice: "編集に成功しました"
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "削除に成功しました"
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :content, :image)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
