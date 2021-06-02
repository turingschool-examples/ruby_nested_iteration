## Ruby Nested Iteration Practice

Starting with the `course_spec`, then moving on to the `school_spec`, unskip tests as you come to them and make each of those tests pass.

Some rules:
* do not create any additional instance variables,
* do not change anything about the tests (except for unskipping them),
* do not create any helper methods.

As you work through this exercise, the classes will eventually respond to the interaction pattern below:

## Student

A student is assigned a group through an attr_accessor - `student.group = :group_name`.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> student = Student.new('Hermione')
#=> #<Student:0x007fa621d0cd38 @group=nil, @name="Hermione">

pry(main)> student.name
#=> "Hermione"

pry(main)> student.group
#=> nil

pry(main)> student.group = :lions

pry(main)> student.group
#=> :lions
```


## Course

The `student_groups` method should return an unique list of groups for the students in that course.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> student1 = Student.new('Malfoy')    
#=> #<Student:0x007ffc8333f130 @group=nil, @name="Malfoy">

pry(main)> student1.group = :snakes    

pry(main)> student2 = Student.new('Ron')    
#=> #<Student:0x007ffc83b00180 @group=nil, @name="Ron">

pry(main)> student2.group = :lions    

pry(main)> student3 = Student.new('Harry')    
#=> #<Student:0x007ffc82a50268 @group=nil, @name="Harry">

pry(main)> student3.group = :lions    

pry(main)> course = Course.new('Chemistry', 'Severus Snape')    
#=> #<Course:0x007ffc82a807d8 @name="Chemistry", @professor="Severus Snape", @students=[]>

pry(main)> course.name
#=> "Potions"

pry(main)> course.professor
#=> "Severus Snape"

pry(main)> course.students
#=> []

pry(main)> course.add_student(student1)    

pry(main)> course.add_student(student2)    

pry(main)> course.add_student(student3)    

pry(main)> course.students
#=> [#<Student:0x007ffc8333f130 @group=:slytherin, @name="Malfoy">,
     #<Student:0x007ffc83b00180 @group=:gryffindor, @name="Ron">,
     #<Student:0x007ffc82a50268 @group=:gryffindor, @name="Harry">]

pry(main)> course.groups
#=> [:snakes, :lions]
```

## School

A school is created with a `name` and and list of study `groups`.  At this school, students are enrolled in courses, and then assigned to their study groups. The `group_students` method should assign a group to every student enrolled in a course or courses at that school.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> require './lib/school'
#=> true

pry(main)> @student1 = Student.new('Malfoy')
#=> #<Student:0x007fb7a42a4fc8 @group=nil, @name="Malfoy">

pry(main)> @student2 = Student.new('Ron')    
#=> #<Student:0x007fb7a4bc7e20 @group=nil, @name="Ron">

pry(main)> @student3 = Student.new('Harry')    
#=> #<Student:0x007fb7a4be6848 @group=nil, @name="Harry">

pry(main)> @student4 = Student.new('Hermione')    
#=> #<Student:0x007fb7a4c04ed8 @group=nil, @name="Hermione">

pry(main)> @student5 = Student.new('Luna')    
#=> #<Student:0x007fb7a50d8ea0 @group=nil, @name="Luna">

pry(main)> @student6 = Student.new('Penelope')    
#=> #<Student:0x007fb7a4c24940 @group=nil, @name="Penelope">

pry(main)> @student7 = Student.new('Ernie')    
#=> #<Student:0x007fb7a42b41f8 @group=nil, @name="Ernie">

pry(main)> @course1 = Course.new('Chemistry', 'Severus Snape')    
#=> #<Course:0x007fb7a4a2ea00 @name="Chemistry", @professor="Severus Snape", @students=[]>

pry(main)> @course1.add_student(@student1)    

pry(main)> @course1.add_student(@student2)    

pry(main)> @course1.add_student(@student3)    

pry(main)> @course2 = Course.new('Criminal Psychology -  Practical Applications', 'Remus Lupin')    
#=> #<Course:0x007fb7a4c8d5a8 @name="Criminal Psychology -  Practical Applications", @professor="Remus Lupin", @students=[]>

pry(main)> @course2.add_student(@student3)    

pry(main)> @course2.add_student(@student4)    

pry(main)> @course2.add_student(@student5)    

pry(main)> @course3 = Course.new('Gardening', 'Pomona Sprout')    
#=> #<Course:0x007fb7a4cdc9f0 @name="Gardening", @professor="Pomona Sprout", @students=[]>

pry(main)> @course3.add_student(@student5)    

pry(main)> @course3.add_student(@student6)    

pry(main)> @course3.add_student(@student7)    

pry(main)> @school = School.new('Pigfreckles', [:lions, :snakes, :eagles, :badgers])    
#=> #<School:0x007fb7a5ae5268 @courses=[], @groups=[:lions, :snakes, :eagles, :badgers], @name="Pigfreckles">

pry(main)> @school.name
#=> "Pigfreckles"

pry(main)> @school.groups
#=> [:lions, :snakes, :eagles, :badgers]

pry(main)> @school.courses
#=> []

pry(main)> @school.add_course(@course1)

pry(main)> @school.add_course(@course2)

pry(main)> @school.add_course(@course3)

pry(main)> @school.courses
#=> [#<Course:0x007fb7a4a2ea00...>, #<Course:0x007fb7a4c8d5a8...>,#<Course:0x007fb7a4cdc9f0...>]

pry(main)> @school.assign_to_group(@student1)

pry(main)> @student1.group
#=> will be one of the 4 groups

pry(main)> @school.group_all_students

pry(main)> @student1.group
#=> will be one of the 4 groups

pry(main)> @student2.group
#=> will be one of the 4 groups

pry(main)> @student3.group
#=> will be one of the 4 groups

...

# We are now resetting the students groups, for the last method.
pry(main)> @student1.group = :snakes    

pry(main)> @student2.group = :lions    

pry(main)> @student3.group = :lions    

pry(main)> @student4.group = :lions    

pry(main)> @student5.group = :eagles    

pry(main)> @student6.group = :eagles    

pry(main)> @student7.group = :badgers    

pry(main)> @school.students_by_group
#=> {:snakes=>[#<Student:0x007fb7a42a4fc8...>],
#    :lions=>[#<Student:0x007fb7a4bc7e20...>,
#                  #<Student:0x007fb7a4be6848...>,
#                  #<Student:0x007fb7a4c04ed8...>],
#    :eagles=>[#<Student:0x007fb7a50d8ea0...>,
#                 #<Student:0x007fb7a4c24940...>],
#    :badgers=>[#<Student:0x007fb7a42b41f8...>]}
```
