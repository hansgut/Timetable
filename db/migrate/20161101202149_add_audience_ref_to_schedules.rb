class AddAudienceRefToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_reference :schedules, :audience, foreign_key: true
  end
end
