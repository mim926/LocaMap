class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :mypage, :edit, :update ]
  before_action :set_user, only: [ :show, :edit, :update ]

  def show
    @user = current_user
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user), success: t("defaults.flash_message.updated", item: User.model_name.human)
    else
      flash.now[:danger] = t("defaults.flash_message.not_updated", item: User.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def mypage
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :local_history, :icon_image, :icon_image_cache)
  end
end
