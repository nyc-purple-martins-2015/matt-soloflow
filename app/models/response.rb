class Response < ActiveRecord::Base
  belongs_to :respondable, polymorphic: true
  has_many :responses, as: :respondable
  belongs_to :user
  has_many :votes, as: :votable

  validates :content, presence: true
end
