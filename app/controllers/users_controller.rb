class UsersController < ApplicationController



  def show
    @user = User.find(params[:id])
    @texts = @user.texts
    @text = Text.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "編集完了"
    else
      @user = current_user
      render "edit"
    end
  end

  def unsubscrube
  end

  def withdraw
  end

  def user_params
    params.require(:user).permit(:name, :profileimage, :introduction)
  end
end
