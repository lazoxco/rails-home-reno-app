class Task < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  # dependent: :destroy means the comments related to the specific task in mention get deleted if the task does.
  has_many :users, through: :comments
end
