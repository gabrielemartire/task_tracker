class Project < ApplicationRecord
  validates :name, presence: true
  
  has_many :tasks, dependent: :destroy
  has_many :comments, through: :tasks
end