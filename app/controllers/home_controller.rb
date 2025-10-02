class HomeController < ApplicationController
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:user, :prefecture, :category).order(created_at: :desc)
  end
end
