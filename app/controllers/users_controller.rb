class UsersController < ApplicationController

  before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @texts = @user.texts
    @text = Text.new
  end

  def edit
  end

  def update
  end

  def unsubscrube
  end

  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :profileimage)
  end
end
