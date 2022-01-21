class TextsController < ApplicationController
  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.user_id = current_user.id
    if @text.save!
      redirect_to user_path(current_user), notice: "新規投稿完了！"
    else
      render 'texts/new'
    end
  end

  def show
    @text = Text.find(params[:id])
    @user = @text.user
    @comment = Comment.new
    #@comments = @text.comment
  end

  def edit
    @text = Text.find(params[:id])
    if @text.user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @text = Text.find(params[:id])
    @text.destroy
    redirect_to user_path(current_user)
  end
  
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def text_params
    params.require(:text).permit(:title, :text, :image)
  end

end
