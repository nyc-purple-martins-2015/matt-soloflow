class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :answers

  validates :title, :content, :user_id, presence: true

  scope :newest, -> { order(created_at: :desc) }

  def formatted_creation_date
    self.created_at.strftime("%m-%d-%y")
  end

  def formatted_last_updated
    self.updated_at.strftime("%m-%d-%y")
  end

  def associate_to_tags!(tag_list)
    tag_list.each do |tag_name|
      new_tag = Tag.find_or_create_by(category: tag_name.strip)
      unless self.tags.include?(new_tag)
        self.tags << new_tag
      end
    end
  end
end
