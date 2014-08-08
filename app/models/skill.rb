class Skill < ActiveRecord::Base
  has_many :user_skills , dependent: :destroy
  validates :description, presence: true, length: {maximum: 50}
end
