class UserSkill < ActiveRecord::Base
  belongs_to :skill 
  belongs_to :user
  validates :user_id, presence: true
  validates :skill_id, presence: true
  validates :level, presence: true
  validates :usedyear, presence: true
end
