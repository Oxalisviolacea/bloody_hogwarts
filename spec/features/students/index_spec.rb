require 'rails_helper'

RSpec.describe "As a visitor" do 
  describe "When I visit '/students'" do
    before(:each) do 
      @student_1 = Student.create(name: 'Casseopia Black',
                                  age: 14,
                                  house: 'Slytherin')
      @student_2 = Student.create(name: 'Harry Potter',
                                  age: 15,
                                  house: 'Gryffindor')
      @student_3 = Student.create(name: 'Nevil',
                                  age: 16,
                                  house: 'Gryffindor')
    end 
    
    it  "I see a list of students with their names, ages, and houses" do
      visit '/students'

      expect(page).to have_content("Name: #{@student_1.name}")
      expect(page).to have_content("Age: #{@student_1.age}")
      expect(page).to have_content("House: #{@student_1.house}")
    end 

    describe "When I visit '/students'" do
      it "I see the average age of all students." do 
        visit '/students'
        expect(page).to have_content("Average age of all students: 15")
      end
    end
  end
end