class AddMonetizedPriceToSessions < ActiveRecord::Migration[6.0]
  def change
    add_monetize :sessions, :price, currency: { present: false }
  end
end
