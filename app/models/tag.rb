class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :category, presence: true

  def recent_questions
    self.questions.order(created_at: :desc)
  end

  def self.most_popular

  end

  def trending

  end
end
