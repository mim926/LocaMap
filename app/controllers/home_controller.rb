class HomeController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user, :prefecture, :category).order(created_at: :desc).page(params[:page]).per(3)
  end
end
