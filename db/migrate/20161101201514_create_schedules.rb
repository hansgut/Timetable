class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :day
      t.integer :period
      t.references :table, index: true
      t.timestamps
    end
  end
end
