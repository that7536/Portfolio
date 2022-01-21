class CommentsController < ApplicationController
  def create
    text = Text.find(params[:text_id])
    comment = current_user.comments.new(comment_params)
    comment.text_id = text.id
    comment.save
    redirect_to text_path(text)
  end

  def destroy
    @text = Text.find(params[:text_id])
    Comment.find_by(id: params[:id],text_id: params[:text_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
