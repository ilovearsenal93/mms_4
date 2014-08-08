class Position < ActiveRecord::Base
  has_many :users
  validates :name, presence: true, length: {maximum: 50}
  validates :abbreviation, presence: true, length: {maximum: 10}
end
