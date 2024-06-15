class Task < ApplicationRecord
  belongs_to :user

  STATUS  = ['Backlog', 'In-progress', 'Done'].freeze

  validates :status, inclusion: { in: STATUS }
end
