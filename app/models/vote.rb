class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

 # validate: only_vote_once

  def only_vote_once(vote)
    if current_user.votes.exists?(user_id: vote.user_id, votable_id: vote.votable_id, votable_type: vote.votable_type)
      false
    else
      true
    end
  end
end
