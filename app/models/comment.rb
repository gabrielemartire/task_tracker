class Comment < ApplicationRecord
  belongs_to :task

  validates :body, presence: true
  validates :author_name, presence: true

  delegate :project, to: :task
end