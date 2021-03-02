class ChangeColumnTypeForStartTimeEndTimeInSessions < ActiveRecord::Migration[6.0]
  def change
    change_column :sessions, :start_time, :datetime
    change_column :sessions, :end_time, :datetime
  end
end
