class User < ActiveRecord::Base
  has_many :user_projects
  has_many :user_skills
  belongs_to :team
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 20}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    length: {maximum:50}
  validates :position, presence: true, length: {maximum: 30}
  validates :birthday, presence: true
  validates :admin, presence: true
  has_secure_password
  validates :password, length: { minimum: 6 }
end
