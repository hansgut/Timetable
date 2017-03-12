class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :day, null: false
      t.integer :period, null: false
      t.references :table, index: true
      t.timestamps
    end
  end
end
