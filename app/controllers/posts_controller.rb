class PostsController < ApplicationController
  before_action :set_form_collections, only: [ :new, :edit, :create, :update ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :likes]

  def index
    @posts = Post.includes(:user, :category, :prefecture).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = t("defaults.flash_message.created", item: Post.model_name.human)
      redirect_to post_path(@post)
    else
      flash.now[:danger] = t("defaults.flash_message.not_created", item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: t("defaults.flash_message.updated", item: Post.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy!
    redirect_to root_path, success: t("defaults.flash_message.deleted", item: Post.model_name.human), status: :see_other
  end

  def likes
    @like_posts = current_user.like_posts.includes(:user).order(created_at: :desc)
  end

  private

  def set_form_collections
    @categories = Category.all
    @prefecture = current_user.prefecture
  end

  def post_params
    params.require(:post).permit(:title, :prefecture_id, :category_id, :address, :description, :image, :image_cache)
  end
end
