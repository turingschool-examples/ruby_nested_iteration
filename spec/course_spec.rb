require 'rspec'
require 'pry'
require './lib/student'
require './lib/course'

RSpec.describe Course do
  before(:each) do
    #setup for all tests below
    @student1 = Student.new('Malfoy')
    @student1.group = :snakes
    @student2 = Student.new('Ron')
    @student2.group = :lions
    @student3 = Student.new('Harry')
    @student3.group = :lions
    @course = Course.new('Chemistry', 'Severus Snape')
  end

  describe 'instantiation' do
    it 'creates an instance' do
      expect(@course).to be_an_instance_of(Course)
    end

    it 'sets a name' do
      expect(@course.name).to eq('Chemistry')
    end

    it 'sets a professor' do
      expect(@course.professor).to eq('Severus Snape')
    end

    it 'starts with no students' do
      expect(@course.students).to eq([])
    end
  end

  describe 'methods' do
    it 'can add a student' do
      @course.add_student(@student1)
      @course.add_student(@student2)
      @course.add_student(@student3)

      expect(@course.students).to eq([@student1, @student2, @student3])
    end

    xit 'gets groups represented' do
      @course.add_student(@student1)
      @course.add_student(@student2)
      @course.add_student(@student3)

      expect(@course.groups_represented).to eq([:snakes, :lions])
    end
  end
end
