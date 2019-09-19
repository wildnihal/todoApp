class TodoList < ApplicationRecord
  belongs_to :user
  paginates_per 3
  PRIORITY_RANGE = 1..5
  validates :title, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 200}
  validates :priority, inclusion: {in: PRIORITY_RANGE }, allow_nil: true
end
