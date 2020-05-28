class School
  attr_reader :name, :houses, :courses

  def initialize(name, houses)
    @name = name
    @houses = houses
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def sort(student)
    student.house = @houses.sample
  end

  def unique_students
    all_students_across_all_courses.uniq
  end

  def all_students_across_all_courses
    @courses.flat_map do |course|
      course.students
    end
  end

  def sort_students
    unique_students.each do |student|
      sort(student)
    end
  end

  def student_names
    unique_students.map {|student| student.name}
  end

  def students_by_house
    unique_students.group_by do |student|
      student.house
    end
  end
end
