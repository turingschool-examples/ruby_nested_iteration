class Student
  attr_reader :name
  attr_accessor :group

  def initialize(name)
    @name = name
    @group = nil
  end
end
