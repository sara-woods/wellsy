class Activity < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :sessions, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end
