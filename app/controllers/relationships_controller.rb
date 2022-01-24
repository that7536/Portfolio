class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
    @text = Text.new
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
    @text = Text.new
  end

end
