require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/student'
require './lib/course'

class CourseTest < Minitest::Test
  def setup
    @student1 = Student.new('Malfoy')
    @student1.house = :slytherin
    @student2 = Student.new('Ron')
    @student2.house = :gryffindor
    @student3 = Student.new('Harry')
    @student3.house = :gryffindor
    @course = Course.new('Potions', 'Severus Snape')
  end

  def test_it_exists
    assert_instance_of Course, @course
  end

  def test_it_has_attributes
    assert_equal 'Potions', @course.name
    assert_equal 'Severus Snape', @course.professor
    assert_equal [], @course.students
  end

  def test_it_adds_students
    @course.add_student(@student1)
    @course.add_student(@student2)
    @course.add_student(@student3)

    assert_equal [@student1, @student2, @student3], @course.students
  end

  def test_it_gets_student_houses
    skip
    @course.add_student(@student1)
    @course.add_student(@student2)
    @course.add_student(@student3)

    assert_equal [:slytherin, :gryffindor], @course.houses_represented
  end
end
