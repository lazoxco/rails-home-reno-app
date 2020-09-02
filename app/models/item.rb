class Item < ApplicationRecord
  belongs_to :task
  validates :name, presence: true
  
  scope :completed, -> { where(status: true) }
end
