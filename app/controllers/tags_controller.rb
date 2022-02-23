class TagsController < ApplicationController

  def search
    @records = Text.all
    @tags = Tag.limit(10)


    if params[:search].present?
      @records = Text.joins(:tags).where("tags.name like '%#{params[:search]}%'").order(created_at: :desc)
      @content = params[:search]
    elsif params[:tag_id].present?
      @records = Text.joins(:tags).where("tags.id = #{params[:tag_id]}").order(created_at: :desc)
      @content = Tag.find(params[:tag_id]).name
    end
    @tag_lists = Tag.all
    @records = @records.page(params[:page]).per(10)
    #joinのことに関して調べる→inner join left join
  end

  def index
    @tags = Tag.page(params[:page]).per(10)
  end

  private

end
