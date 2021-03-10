class Order < ApplicationRecord
  belongs_to :user
  belongs_to :session
  monetize :amount_cents
end
