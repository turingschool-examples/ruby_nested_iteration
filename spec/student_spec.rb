require 'rspec'
require 'pry'
require './lib/student'

RSpec.describe Student do
  #setup for all tests below
  student = Student.new('Hermione')
  
  describe 'instantiation' do
    it 'creates an instance' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'sets a name' do
      expect(student.name).to eq("Hermione")
    end

    it 'starts with no house' do
      expect(student.house).to eq(nil)
    end
  end

  describe 'methods' do
    it 'can be assigned to a house' do
      student.house = :gryffindor

      expect(student.house).to eq(:gryffindor)
    end
  end
end
