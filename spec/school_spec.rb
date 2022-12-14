require 'rspec'
require 'pry'
require './lib/student'
require './lib/course'
require './lib/school'

RSpec.describe School do
  before(:each) do
    # this is the setup for all tests below.
    @student1 = Student.new('Tucker')
    @student2 = Student.new('Penny')
    @student3 = Student.new('Bo')
    @student4 = Student.new('Bruce')
    @student5 = Student.new('Rey')
    @student6 = Student.new('KJ')
    @student7 = Student.new('Tess')
    @course1 = Course.new('Philosophy', 'Charles Babbage')
    @course1.add_student(@student1)
    @course1.add_student(@student2)
    @course1.add_student(@student3)
    @course2 = Course.new('Cryptology', 'Joan Clarke')
    @course2.add_student(@student3)
    @course2.add_student(@student4)
    @course2.add_student(@student5)
    @course3 = Course.new('Mathematics', 'Ada Lovelace')
    @course3.add_student(@student5)
    @course3.add_student(@student6)
    @course3.add_student(@student7)
    @school = School.new('Turing School', [:bhatt, :ellis, :hopper, :windsor])
  end

  describe 'instantiation' do
    it 'creates instance' do
      expect(@school).to be_an_instance_of(School)
    end

    it 'sets a name' do
      expect(@school.name).to eq("Turing School")
    end

    it 'sets its groups' do
      expect(@school.groups).to eq([:bhatt, :ellis, :hopper, :windsor])
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
        'Tucker',
        'Penny',
        'Bo',
        'Bruce',
        'Rey',
        'KJ',
        'Tess',
      ]

      expect(@school.names).to eq(expected)
    end

    xit 'can return all students by group' do
      @school.add_course(@course1)
      @school.add_course(@course2)
      @school.add_course(@course3)
      @student1.group = :ellis
      @student2.group = :bhatt
      @student3.group = :bhatt
      @student4.group = :bhatt
      @student5.group = :hopper
      @student6.group = :hopper
      @student7.group = :windsor

      expected = {
        ellis: [@student1],
        bhatt: [@student2, @student3, @student4],
        hopper: [@student5, @student6],
        windsor: [@student7]
      }

      expect(@school.students_by_group).to eq(expected)
    end
  end
end
