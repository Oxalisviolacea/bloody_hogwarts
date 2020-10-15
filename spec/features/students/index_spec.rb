require 'rails_helper'

RSpec.describe "As a visitor" do 
  describe "When I visit '/students'" do
    before(:each) do 
      @student_1 = Student.create(name: 'Casseopia Black',
                                  age: 14,
                                  house: 'Slytherin')
    end 
    it  "I see a list of students with their names, ages, and houses" do
    visit '/students'

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.age)
    expect(page).to have_content(@student_1.house)
    end 
  end
end