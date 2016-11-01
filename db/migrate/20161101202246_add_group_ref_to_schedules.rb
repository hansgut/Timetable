class AddGroupRefToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :group, foreign_key: true
  end
end
