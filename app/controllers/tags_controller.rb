class TagsController < ApplicationController
  def index
    @tags = Tags.all
  end

  def show
    @tag =Tag.includes(:questions).find(params[:id])
  end
end
