class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :booked_sessions, through: :bookings, source: :sessions
  has_many :sessions, through: :activities
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_many :orders, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :zoom_link, :bio, presence: true, if: -> { trainer }

  def average_rating
    return if activities.nil?
    average_rating  = 0
    count = 0
    activities.each do |activity|
      activity.reviews.each do |review|
        count += 1
        average_rating += review.rating
      end
    end

    if count == 0
      return 0
    else
      return average_rating = (average_rating.to_f / count).round(1)
    end
  end


end
