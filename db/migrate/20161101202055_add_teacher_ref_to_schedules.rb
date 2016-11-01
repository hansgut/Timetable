class AddTeacherRefToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :teacher, foreign_key: true
  end
end
