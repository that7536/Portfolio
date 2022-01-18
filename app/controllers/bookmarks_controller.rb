class BookmarksController < ApplicationController
  def index
    #@texts = current_user.texts.find(params[:text_id])
    #@user =  @user = User.find(params[:user_id])
    @texts = Text.where(id: current_user.bookmarks.pluck(:id))
    #↑wherh:中にあるすべてのデータを取得する
    #↑↑pluck:指定したカラムの値を配列で返してくれる
    #つまりcurrent_userが保存したデータをpluckで回収してwhereで全部出してくる(みたいなイメージ)
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
  end
end
