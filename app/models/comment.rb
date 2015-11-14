class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :votes, as: :votable

  validates :content, presence: true

  def formatted_creation_date
    self.created_at.strftime("%m-%d-%y")
  end

  def formatted_last_updated
    self.updated_at.strftime("%m-%d-%y")
  end
end
