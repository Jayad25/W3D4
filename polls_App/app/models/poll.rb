class Poll < ApplicationRecord
  validates :user_id, presence: true
end
