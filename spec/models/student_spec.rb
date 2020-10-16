require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it "can find the average age of all students" do 
      @student_1 = Student.create(name: 'Casseopia Black',
                                  age: 14,
                                  house: 'Slytherin')
      @student_2 = Student.create(name: 'Harry Potter',
                                  age: 15,
                                  house: 'Gryffindor')
      @student_3 = Student.create(name: 'Nevil',
                                  age: 16,
                                  house: 'Gryffindor')

      expect(Student.average_age).to eq(15)
    end 
  end
end
