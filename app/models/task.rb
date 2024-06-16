class Task < ApplicationRecord
  belongs_to :user

  STATUS  = ['Backlog', 'In-progress', 'Done'].freeze

  validates :status, inclusion: { in: STATUS }

  def self.statuses
    STATUS
  end

  def self.complete_task
    update(completed: true) if status == "Done"
  end
end
