class Schedule < ApplicationRecord
  has_many :teachers
  has_many :groups
  has_many :audience
  has_many :subjects
end
