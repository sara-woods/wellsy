class RemovePriceFromSessions < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :price
  end
end
