class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

  def group_all_students
    @courses.each do |course|
      course.students.each do |student|
        student.group = @groups.sample
      end 
    end 
  end 
  
  def names 
    # this would be a good method to utilize the flat_map enumerable
    student_names = []
    @courses.each do |course|
      course.students.each do |student|
        student_names << student.name if !student_names.include?(student.name)
      end 
    end 
    student_names
  end 

  def students_by_group
    students_by_group = Hash.new()
    @courses.each do |course|
      course.students.each do |student|
        if students_by_group[student.group] && !students_by_group[student.group].include?(student)
          students_by_group[student.group] << student
        elsif students_by_group[student.group] == nil
          students_by_group[student.group] = [student]
        end 
      end 
    end 
    students_by_group
  end 
end
