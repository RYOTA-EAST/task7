class Todo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :status_id, numericality: { greater_than_or_equal_to: 2 }
  validates :priority_id, numericality: { greater_than_or_equal_to: 2 }
  validates :deadline, presence: true

  belongs_to :user
  belongs_to_active_hash :status
  belongs_to_active_hash :priority
end
