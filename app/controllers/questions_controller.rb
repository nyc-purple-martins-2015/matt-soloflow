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
  end


  def question_params
    params.require(:todo).permit(:title, :content)
  end



end
