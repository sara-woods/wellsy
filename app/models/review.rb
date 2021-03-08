class Review < ApplicationRecord
  belongs_to :user
  belongs_to :session

  validates :rating, inclusion: { in: 1..5 }
end
