class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :day
      t.integer :period

      t.timestamps
    end
  end
end
