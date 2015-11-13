class Tag < ActiveRecord::Base
  has_many :question_tags
  has_many :questions, through: :question_tags

  validates :category, presence: true

  def recent_questions
    questions.order(created_at: :desc).limit(20)
  end
end
