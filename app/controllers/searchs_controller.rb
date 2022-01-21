class SearchsController < ApplicationController
  def search
    # viewのform_tagにて選択したmodelの値を@modelに代入。
    @model = params["model"]
    # 選択した検索方法の値を@methodに代入。
    @method = params["method"]
    # 検索ワードを@contentに代入。
    @content = params["content"]
    # @model, @content, @methodを代入した、
    # search_forを@recordsに代入。
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    # モデルがuser
    if model == 'user'
      # 検索方法が完全一致
      if method == 'perfect'
        User.where(name: content)
      # 検索方法が部分一致
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    # モデルがtest
    elsif model == 'text'
      if method == 'perfect'
        Text.where(title: content)
      else
        Text.where('title LIKE ?', '%'+content+'%')
      end
    # モデルがtag
    elsif model == 'Tag'
      if method == 'perfect'
        Tag.where(name: content)
      else
        Tag.where('name LIKE ?', '%'+content+'%')
      end
    end
  end
end
