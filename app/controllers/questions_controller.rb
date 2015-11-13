class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = current_user
    @question = @user.questions.new(question_params)
    @tags = tag_params[:tags].split(",")
      if @question.save
        @tags.each do |tag|
          new_tag = Tag.find_or_create_by(category: tag.strip)
          unless @question.tags.include?(new_tag)
            @question.tags << new_tag
          end
        end
        redirect_to question_path(@question)
      else
        render :new
      end
  end

  def show
    @user = current_user
    @question = Question.find(params[:id])
    @answers = @question.answers
    @tags = @question.tags
    ## refactor to query with includes, unsure of querying relationships in the view
  end

private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def tag_params
    params.require(:question).permit(:tags)
  end
end
