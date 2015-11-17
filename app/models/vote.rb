class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :votable_type, presence: true
  validates :votable_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
 # validate: only_vote_once

  # by convention boolean methods are ended by ? in Ruby.
  def only_vote_once(vote)
    current_user.votes.exists?(user_id: vote.user_id, votable_id: vote.votable_id, votable_type: vote.votable_type)
  end
end
