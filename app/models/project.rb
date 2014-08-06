class Project < ActiveRecord::Base
  has_many :user_projects
  belongs_to :team
end
