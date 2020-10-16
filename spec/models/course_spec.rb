require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end

  describe 'instance methods' do
    it "can count students in a course" do 
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
      
      expect(@course_1.count_students).to eq(2)
      expect(@course_2.count_students).to eq(1)
    end
  end
end
