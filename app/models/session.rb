class Session < ApplicationRecord
  belongs_to :activity
  has_many :bookings, dependent: :destroy
  has_many :attendees, through: :bookings, source: :user
  has_many :reviews, dependent: :destroy
  has_one :room
  after_create :create_room
  has_many :orders, dependent: :destroy


  delegate :category, to: :activity


  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :max_participants, presence: true
  validates :min_participants, presence: true
  validates :price, presence: true

  validate :class_size

  monetize :price_cents

  def empty?
    bookings.empty?
  end


  def create_room
    Room.create(session: self)
  end
  
  def full?
    max_participants == bookings.count
  end

  private

  def class_size
    if min_participants > max_participants
      errors.add(:min_participants, "cannot exceed # of max participants")
    end
  end

end
