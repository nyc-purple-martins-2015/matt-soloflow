class User < ActiveRecord::Base
  has_many :questions
  has_many :responses
  has_many :votes, through: :questions
  has_many :votes, through: :responses
  has_secure_password

  validates :username, :email, presence: true, uniqueness: true

  def current_user
    @current_user ||= User.find_by(id: session[:user])
  end

end
