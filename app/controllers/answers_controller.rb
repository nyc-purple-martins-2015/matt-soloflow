class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @user = User.find(session[:user_id])
    @question = Question.find(params[:question_id])
    #TODO: Refactor line 12 to not be hardcoded.
    @answer = @question.answers.new(content: answer_params[:content], user_id: @user.id)
    if @answer.save!
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    if @answer.save!
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :content)
  end

 # def question_params
    # params.require(:question).permit(:title, :content)
  # end
end
