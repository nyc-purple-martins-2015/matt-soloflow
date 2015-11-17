class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
  end

  def create
    @question = Question.find(params[:question_id])
    #TODO: Refactor line 12 to not be hardcoded.
    # Be aware the collection.new method is NOT fully supported in older
    # rails...so if you go out into the real world this could break on Rails
    # 3.x systems (the majority of Rails systems in production today). #build
    # is history-compatible
    @answer = @question.answers.new(content: answer_params[:content], user: current_user)
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
    @answer.mark_as_best # I might suggest that this have a ! at the end because you're changing something?
    @answer.save! # I would argue that this should go into mark_as_best hence the bang-appellation of that method name
    redirect_to question_path(@answer.question_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :content)
  end
end
