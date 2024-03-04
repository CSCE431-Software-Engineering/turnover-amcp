class RemoveStartTimeAndEndTimeFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :start_time, :time
    remove_column :activities, :end_time, :time
  end
end
