class Session < ApplicationRecord
  belongs_to :activity
   has_many :bookings

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_participants, presence: true
  validates :min_participants, presence: true
  validates :price, presence: true
end
