class TagsController < ApplicationController

  def index
    @records = Text.all


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

  private

end
