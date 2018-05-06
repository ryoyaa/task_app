class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    unless current_user.favorites.nil?
      @user = current_user
      @q = @user.favorite_topics.ransack(params[:q])
      @favorite_topics = @q.result.page(params[:page]).per(8).order(updated_at: :desc)
      @new_topics = @user.topics.order(created_at: :desc).limit(5)
    else
      redirect_to topics_path, notice: "お気に入りが存在しません"
    end
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    if favorite.save
      redirect_to topics_path, notice: 'お気に入りに登録しました'
    else
      redirect_to topics_path, notice: 'お気に入りに登録に失敗しました'
    end
  end
end
