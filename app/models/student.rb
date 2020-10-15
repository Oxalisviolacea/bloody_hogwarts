class Student < ApplicationRecord
  has_many :courses
  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :house
end
