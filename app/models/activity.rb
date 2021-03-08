class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :sessions, dependent: :destroy
  has_many :reviews, through: :sessions

  validates :name, presence: true
  validates :description, presence: true
end
