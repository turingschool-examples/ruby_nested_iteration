require 'rspec'
require 'pry'
require './lib/student'
require './lib/course'
require './lib/school'

RSpec.describe School do
  before(:each) do
    # this is the setup for all tests below.
    @student1 = Student.new('Malfoy')
    @student2 = Student.new('Ron')
    @student3 = Student.new('Harry')
    @student4 = Student.new('Hermione')
    @student5 = Student.new('Luna')
    @student6 = Student.new('Penelope')
    @student7 = Student.new('Ernie')
    @course1 = Course.new('Chemistry', 'Severus Snape')
    @course1.add_student(@student1)
    @course1.add_student(@student2)
    @course1.add_student(@student3)
    @course2 = Course.new('Criminal Psychology -  Practical Applications', 'Remus Lupin')
    @course2.add_student(@student3)
    @course2.add_student(@student4)
    @course2.add_student(@student5)
    @course3 = Course.new('Gardening', 'Pomona Sprout')
    @course3.add_student(@student5)
    @course3.add_student(@student6)
    @course3.add_student(@student7)
    @school = School.new('Pigfreckles', [:lions, :snakes, :eagles, :badgers])
  end

  describe 'instantiation' do
    it 'creates instance' do
      expect(@school).to be_an_instance_of(School)
    end

    it 'sets a name' do
      expect(@school.name).to eq("Pigfreckles")
    end

    it 'sets its groups' do
      expect(@school.groups).to eq([:lions, :snakes, :eagles, :badgers])
    end

    it 'starts with no courses' do
      expect(@school.courses).to eq([])
    end
  end

  describe 'methods' do
    it 'can add a course' do
      @school.add_course(@course1)
      @school.add_course(@course2)
      @school.add_course(@course3)

    expect(@school.courses).to eq([@course1, @course2, @course3])
    end

    it 'can assign a student to a group' do
      expect(@student1.group.nil?).to eq(true)

      @school.assign_to_group(@student1)

      expect(@student1.group.nil?).to eq(false)
      expect(@school.groups.include?(@student1.group)).to eq(true)
    end

    xit 'can assign all students to groups at once' do
      @school.add_course(@course1)
      @school.add_course(@course2)
      @school.add_course(@course3)

      @school.group_all_students

      # This array of students will be used only in this test, to verify that after `school.group_all_students` is called, each student has a group (through the each iteration below)
      students = [
        @student1,
        @student2,
        @student3,
        @student4,
        @student5,
        @student6,
        @student7
      ]

      students.each do |student|
        expect(@school.groups.include?(student.group)).to eq(true)
        expect(student.group.nil?).to eq(false)
      end
    end

    xit 'can list all students by name' do
      @school.add_course(@course1)
      @school.add_course(@course2)
      @school.add_course(@course3)

      expected = [
        'Malfoy',
        'Ron',
        'Harry',
        'Hermione',
        'Luna',
        'Penelope',
        'Ernie',
      ]

      expect(@school.names).to eq(expected)
    end

    xit 'can return all students by group' do
      @school.add_course(@course1)
      @school.add_course(@course2)
      @school.add_course(@course3)
      @student1.group = :snakes
      @student2.group = :lions
      @student3.group = :lions
      @student4.group = :lions
      @student5.group = :eagles
      @student6.group = :eagles
      @student7.group = :badgers

      expected = {
        snakes: [@student1],
        lions: [@student2, @student3, @student4],
        eagles: [@student5, @student6],
        badgers: [@student7]
      }

      expect(@school.students_by_group).to eq(expected)
    end
  end
end
