class User < ActiveRecord::Base
  attr_accessor :not_validates_password
  has_many :user_projects
  has_many :user_skills
  belongs_to :position
  belongs_to :team
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: {maximum:50}
  validates :birthday, presence: true
  validates :admin, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }, unless: :not_validates_password
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
