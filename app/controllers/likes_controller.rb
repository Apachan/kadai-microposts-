class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = User.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = "お気に入り登録しました"
    redirect_to root_path
  end

  def destroy
    micropost = User.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入り解除しました'
    redirect_to root_path
  end

  def index
    @likes = current_user.likes.all
  end

end
