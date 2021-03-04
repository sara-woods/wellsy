class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings
  has_many :attendees, through: :bookings, source: :user


  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_participants, presence: true
  validates :min_participants, presence: true
  validates :price, presence: true

  validate :class_size

  private

  def class_size
    if min_participants > max_participants
      errors.add(:min_participants, "cannot exceed # of max participants")
    end
  end

end
