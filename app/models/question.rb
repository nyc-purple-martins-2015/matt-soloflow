class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers

  validates :title, :content, :user_id, presence: true

  scope :recent, -> { where('created_at = ?', Time.now - 5.minute) }
  #TODO: scope :most_popular, -> { where(votes...): :desc }

  # Dry these up
  def formatted_creation_date
    self.created_at.strftime("%m-%d-%y")
  end

  def formatted_last_updated
    self.updated_at.strftime("%m-%d-%y")
  end
end
