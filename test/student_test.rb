require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/student'

class StudentTest < Minitest::Test
  def setup
    @student = Student.new('Hermione')
  end

  def test_it_exists
    assert_instance_of Student, @student
  end

  def test_it_has_attributes
    assert_equal 'Hermione', @student.name
    assert_nil @student.house
  end

  def test_it_can_be_assigned_a_house
    @student.house = :gryffindor

    assert_equal :gryffindor, @student.house
  end
end
