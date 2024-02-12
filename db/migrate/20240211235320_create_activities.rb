class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :event_name
      t.time :start_time
      t.time :end_time
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :description
      t.string :activity_type

      t.timestamps
    end
  end
end
