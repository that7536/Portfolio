class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    current_user.follow(params[:user_id])
    #非同期通信のため消去
    #redirect_to request.referer
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    #非同期通信のため消去
    #redirect_to request.referer
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
