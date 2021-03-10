class AddSessionToRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :session
  end
end
