class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @user = User.find(session[:user_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(content: answer_params[:content], user_id: @user.id)
    if @answer.save
      redirect_to question_path(@question)
    else
      @errors = @answer.errors.full_messages
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
    if @answer
      @answer.update_attributes(answer_params)
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  def best
    @answer = Answer.find(params[:answer])
    @answer.mark_as_best
    if @answer.save
      redirect_to question_path(@answer.question_id)
    else
      @errors = @answer.errors.full_messages
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :content)
  end
end
