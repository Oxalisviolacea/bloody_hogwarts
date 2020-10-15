class StudentCourse < ApplicationRecord
  belongs_to :student 
  belongs_to :course 

  has_many :courses, through: :student_courses
end
