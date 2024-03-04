class RemoveStartAndEndDatesFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_column :activities, :start_date, :date
    remove_column :activities, :end_date, :date
  end
end
