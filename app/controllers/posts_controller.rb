class PostsController < ApplicationController
  def index
     @posts = Post.includes(:user, :category, :prefecture).order(created_at: :desc)
  end
end
