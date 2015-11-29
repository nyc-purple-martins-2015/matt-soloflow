class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  validates :content, :user_id, :question_id, presence: true

  def mark_as_best
    self.best = true
  end

  def formatted_creation_date
    self.created_at.strftime("%m-%d-%y")
  end

  def formatted_last_updated
    self.updated_at.strftime("%m-%d-%y")
  end
end
