class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :activities
  has_many :bookings
  has_many :booked_sessions, through: :bookings, source: :sessions
  has_many :sessions, through: :activities
  has_one_attached :photo

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :zoom_link, :bio, presence: true, if: -> { trainer }
end
