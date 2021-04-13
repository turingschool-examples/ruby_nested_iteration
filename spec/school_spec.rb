require 'rspec'
require 'pry'
require './lib/student'
require './lib/course'
require './lib/school'

RSpec.describe School do
  # this is the setup for all tests below.
  student1 = Student.new('Malfoy')
  student2 = Student.new('Ron')
  student3 = Student.new('Harry')
  student4 = Student.new('Hermione')
  student5 = Student.new('Luna')
  student6 = Student.new('Penelope')
  student7 = Student.new('Ernie')
  course1 = Course.new('Potions', 'Severus Snape')
  course1.add_student(student1)
  course1.add_student(student2)
  course1.add_student(student3)
  course2 = Course.new('Defense Against the Dark Arts', 'Remus Lupin')
  course2.add_student(student3)
  course2.add_student(student4)
  course2.add_student(student5)
  course3 = Course.new('Herbology', 'Pomona Sprout')
  course3.add_student(student5)
  course3.add_student(student6)
  course3.add_student(student7)
  school = School.new('Hogwarts', [:gryffindor, :slytherin, :ravenclaw, :hufflepuff])

  describe 'instantiation' do
    it 'creates instance' do
      expect(school).to be_an_instance_of(School)
    end

    it 'sets a name' do
      expect(school.name).to eq("Hogwarts")
    end

    it 'sets its houses' do
      expect(school.houses).to eq([:gryffindor, :slytherin, :ravenclaw, :hufflepuff])
    end

    it 'starts with no courses' do
      expect(school.courses).to eq([])
    end
  end

  describe 'methods' do
    it 'can add a course' do
      school.add_course(course1)
      school.add_course(course2)
      school.add_course(course3)

    expect(school.courses).to eq([course1, course2, course3])
    end

    it 'can sort a student' do
      expect(student1.house.nil?).to eq(true)

      school.sort(student1)

      expect(student1.house.nil?).to eq(false)
      expect(school.houses.include?(student1.house)).to eq(true)
    end

    xit 'can sort all students at once' do
      school.add_course(course1)
      school.add_course(course2)
      school.add_course(course3)

      school.sort_students

      students = [
        student1,
        student2,
        student3,
        student4,
        student5,
        student6,
        student7
      ]

      students.each do |student|
        expect(school.houses.include?(student.house)).to eq(true)
        expect(student.house.nil?).to eq(false)
      end
    end

    xit 'can list all students by name' do
      school.add_course(course1)
      school.add_course(course2)
      school.add_course(course3)

      expected = [
        'Malfoy',
        'Ron',
        'Harry',
        'Hermione',
        'Luna',
        'Penelope',
        'Ernie',
      ]

      expect(student.names).to eq(expected)
    end

    xit 'can group all students by house' do
      school.add_course(course1)
      school.add_course(course2)
      school.add_course(course3)
      student1.house = :slytherin
      student2.house = :gryffindor
      student3.house = :gryffindor
      student4.house = :gryffindor
      student5.house = :ravenclaw
      student6.house = :ravenclaw
      student7.house = :hufflepuff

      expected = {
        slytherin: [student1],
        gryffindor: [student2, student3, student4],
        ravenclaw: [student5, student6],
        hufflepuff: [student7],
      }

      expect(school.students_by_house).to eq(expected)
    end
  end
end
