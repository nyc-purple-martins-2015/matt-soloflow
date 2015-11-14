class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user, :logged_in?

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def voted?(vote)
    unless current_user.votes.exists?(user_id: vote.user_id, votable_id: vote.votable_id, votable_type: vote.votable_type, value: vote.value)
    end
  end

  protect_from_forgery with: :exception
end
