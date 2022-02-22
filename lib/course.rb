class Course
  attr_reader :name, :professor, :students

  def initialize(name, professor)
    @name = name
    @professor = professor
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def groups_represented
    @students.map do |student| 
      student.group
    end.uniq
  end   
end
