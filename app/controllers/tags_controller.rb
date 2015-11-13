class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag =Tag.find(params[:id])
    @questions = @tag.recent_questions
  end
end
