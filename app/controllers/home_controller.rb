class HomeController < ApplicationController
  def index
    @posts = Post.includes(:user, :prefecture, :category).order(created_at: :desc)
  end
end
