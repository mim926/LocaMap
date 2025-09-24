class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.like(post)
    redirect_back fallback_location: posts_path, success: t(".success")
  end

  def destroy
    post = Post.find_by(id: params[:post_id])
    current_user.unlike(post)
    redirect_back fallback_location: posts_path, success: t(".success"), status: :see_other
  end
end
