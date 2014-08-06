class Project < ActiveRecord::Base
  has_many :user_projects
  belongs_to :team
  validates :name, presence: true, length: {maximum: 30}
  validates :shortname, presence: true, length: {maximum: 10}
  validates :team_id, presence: true
end

