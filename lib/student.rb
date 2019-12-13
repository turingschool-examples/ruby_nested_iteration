class Student
  attr_reader :name
  attr_accessor :house

  def initialize(name)
    @name = name
    @house = nil
  end
end
