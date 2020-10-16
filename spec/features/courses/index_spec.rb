require 'rails_helper'

RSpec.describe "As a visitor," do 
  describe "when I visit '/courses'" do 
    it "I see a list of courses and the number of students enrolled in each course." do
      @student_1 = Student.create(name: 'Casseopia Black',
                                  age: 14,
                                  house: 'Slytherin')
      @student_2 = Student.create(name: 'Harry Potter',
                                  age: 14,
                                  house: 'Gryffindor')
      @course_1 = Course.create!(name: "Defense against the Dark Arts")
      @course_2 = Course.create!(name: "Herbology")

      StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
      StudentCourse.create!(student_id: @student_2.id, course_id: @course_1.id)
      StudentCourse.create!(student_id: @student_2.id, course_id: @course_2.id)

      visit '/courses'

      expect(page).to have_content("Defense against the Dark Arts: 2")
      expect(page).to have_content("Herbology: 1")
    end
  end
end