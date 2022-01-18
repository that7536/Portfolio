class TextsController < ApplicationController
  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.user_id = current_user.id
    if @text.save
      redirect_to user_path(current_user), notice: "新規投稿完了！"
    else
      @texts = Text.all
      render 'index'
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def text_params
    params.require(:text).permit(:title, :text)
  end

end
