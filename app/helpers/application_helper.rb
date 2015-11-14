module ApplicationHelper

  def user_questions?
    @user.questions.exists?
  end

  def user_answers?
    @user.answers.exists?
  end

  def user_comments?
    @user.comments.exists?
  end

end
