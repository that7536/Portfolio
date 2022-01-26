class CommentsController < ApplicationController
  def create
    text = Text.find(params[:text_id])
    comment = current_user.comments.new(comment_params)
    comment.text_id = text.id
    if comment.save
      redirect_to text_path(text)
    else
      redirect_to text_path(text)
    end
  end

  def destroy
    @text = Text.find(params[:text_id])
    Comment.find_by(id: params[:id],text_id: params[:text_id]).destroy
    redirect_to text_path(params[:text_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
