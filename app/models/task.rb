class Task < ApplicationRecord
  belongs_to :user

  STATUS  = ['Backlog', 'In-progress', 'Done'].freeze

  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :deadline, presence: true
  validates :status, inclusion: { in: STATUS }

  def self.statuses
    STATUS
  end
end
