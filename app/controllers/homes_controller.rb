class HomesController < ApplicationController
  def top
    @texts = Text.all
  end

end
