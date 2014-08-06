class User < ActiveRecord::Base
  has_many :user_projects
  has_many :user_skills
  belongs_to :team
end
