class BookmarksController < ApplicationController
  def index
    #@texts = current_user.texts.find(params[:text_id])
    #@user =  @user = User.find(params[:user_id])
   # @texts = Text.where(id: current_user.bookmarks.pluck(:id))
    #@texts = current_user.bookmarks
    @texts = Text.all
    @text = current_user.texts
    #binding.pry


  end

  def create
    bookmark = Bookmark.new(text_id:params[:text_id])
    bookmark.user_id = current_user.id
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def bookmark_params
      params.permit(:text_id)
  end

  def destroy

    bookmark = Bookmark.find_by(params[:id], text_id: params[:text_id])
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:text_id)
  end
end
