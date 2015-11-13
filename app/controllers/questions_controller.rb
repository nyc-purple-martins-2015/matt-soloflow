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
  end

  def show
  end


private

  def question_params
    params.require(:todo).permit(:title, :content)
  end

end
