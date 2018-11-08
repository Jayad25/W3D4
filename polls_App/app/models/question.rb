class Question < ApplicationRecord
  validates :poll_id, presence: true
end
