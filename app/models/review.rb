class Review < ApplicationRecord
  belongs_to :user
  belongs_to :session

  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
  validates :session, uniqueness: { scope: :user, message: "You have already reviewed this session" }
end
