class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(session[:user_id])
    @question = @user.questions.new(question_params)
    @tag = Tag.new
    @tags = tag_params[:tags].split(",")
      if @question.save
        @tags.each do |tag|
          @question.tags << Tag.find_or_create_by(category: tag.strip)
        end
        redirect_to question_path(@question)
      else
        render :new
      end
  end

##MAKE A SHOW VIEW AND CONTROLLER


private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def tag_params
    params.require(:question).permit(:tags)
  end
end
