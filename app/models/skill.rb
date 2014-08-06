class Skill < ActiveRecord::Base
  has_many :user_skills 
  validates :description, presence: true, length: {maximum: 50}
end
