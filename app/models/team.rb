class Team < ActiveRecord::Base
  has_many :projects
  has_many :users
  validates :name, presence: true, length: {maximum: 20}
  validates :description, presence: true, length: {maximum: 50}
end
