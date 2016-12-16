class Table < ApplicationRecord
  has_many :schedules
  belongs_to :group
end
