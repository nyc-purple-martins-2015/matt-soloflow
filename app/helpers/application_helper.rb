module ApplicationHelper

  # @user.has_questions?
  # 
  # this is why i hate helpers.  they tend to encourage you to write methods
  # that are unbonded to classess from an OO perspective.  the responsibility
  # of knowing whether a given user has questions CERTINALY belongs on a, uh,
  # User class
  #
  # And bonus, you could totally model spec test that.
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
