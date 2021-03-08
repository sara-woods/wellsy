class Booking < ApplicationRecord
  belongs_to :session
  belongs_to :user

  validates :session, uniqueness: { scope: :user }
end
