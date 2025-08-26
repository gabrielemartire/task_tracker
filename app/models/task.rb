class Task < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :priority, presence: true, numericality: { 
    in: 1..5, 
    message: "must be between 1 and 5" 
  }
  
  enum :status, { 
    todo: 0, 
    in_progress: 1, 
    done: 2 
  }
end