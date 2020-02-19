require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/student'
require './lib/course'
require './lib/school'

class SchoolTest < Minitest::Test
  def setup
    @student1 = Student.new('Malfoy')
    @student2 = Student.new('Ron')
    @student3 = Student.new('Harry')
    @student4 = Student.new('Hermione')
    @student5 = Student.new('Luna')
    @student6 = Student.new('Penelope')
    @student7 = Student.new('Ernie')
    @course1 = Course.new('Potions', 'Severus Snape')
    @course1.add_student(@student1)
    @course1.add_student(@student2)
    @course1.add_student(@student3)
    @course2 = Course.new('Defense Against the Dark Arts', 'Remus Lupin')
    @course2.add_student(@student3)
    @course2.add_student(@student4)
    @course2.add_student(@student5)
    @course3 = Course.new('Herbology', 'Pomona Sprout')
    @course3.add_student(@student5)
    @course3.add_student(@student6)
    @course3.add_student(@student7)
    @school = School.new('Hogwarts', [:gryffindor, :slytherin, :ravenclaw, :hufflepuff])
  end

  def test_it_exists
    assert_instance_of School, @school
  end

  def test_it_has_attributes
    assert_equal 'Hogwarts', @school.name
    assert_equal [:gryffindor, :slytherin, :ravenclaw, :hufflepuff], @school.houses
    assert_equal [], @school.courses
  end

  def test_it_can_add_courses
    @school.add_course(@course1)
    @school.add_course(@course2)
    @school.add_course(@course3)

    assert_equal [@course1, @course2, @course3], @school.courses
  end

  def test_it_can_sort_a_student
    @school.sort(@student1)

    assert @school.houses.include?(@student1.house)
  end

  def test_it_can_sort_all_students
    skip
    @school.add_course(@course1)
    @school.add_course(@course2)
    @school.add_course(@course3)
    
    @school.sort_students

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
      assert @school.houses.include?(student.house)
    end
  end

  def test_it_can_list_all_students_by_name
    skip
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

    assert_equal expected, @school.student_names
  end

  def test_it_can_list_all_students_by_house
    skip
    @school.add_course(@course1)
    @school.add_course(@course2)
    @school.add_course(@course3)
    @student1.house = :slytherin
    @student2.house = :gryffindor
    @student3.house = :gryffindor
    @student4.house = :gryffindor
    @student5.house = :ravenclaw
    @student6.house = :ravenclaw
    @student7.house = :hufflepuff

    expected = {
      slytherin: [@student1],
      gryffindor: [@student2, @student3, @student4],
      ravenclaw: [@student5, @student6],
      hufflepuff: [@student7],
    }

    assert_equal expected, @school.students_by_house
  end
end
