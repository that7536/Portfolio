class TextsController < ApplicationController
  def new
    @text = Text.new
  end

  def create
    @text = Text.new(text_params)
    @text.user_id = current_user.id
    if !params[:text][:tag].nil?
      tag_list = params[:text][:tag].split(',')#,(カンマ)があれば"文字"を分割することができる
    else
      tag_list = []
    end
    if @text.save
      if @text.image.nil?

      else
        tags = Vision.get_image_data(@text.image)
        tag_list.push(tags)
#        tags.each do |tag|
#          @text.tags.create(name: tag)
#        end
        @text.save_tag(tag_list.uniq)
      end


      redirect_to user_path(current_user), notice: "新規投稿完了！"
    else
      render 'texts/new'
    end

  end

  def index
    @texts = Text.all
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

  def update
    @text = Text.find(params[:id])
    if !params[:text][:tag].nil?
      tag_list = params[:text][:tag].split(',')
    else
      tag_list = []
    end
    if @text.update(text_params)
      @text.tags.delete_all
      @text.save_tag(tag_list)
      redirect_to text_path(@text), notice: "編集完了"
    else
      @text = Text.find(params[:id])
      render "edit"
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
    params.require(:text).permit(:title, :text, :image, :comment)
  end

end
