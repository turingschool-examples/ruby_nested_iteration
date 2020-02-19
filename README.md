## Ruby Nested Iteration Practice

Starting with the `CourseTest`, then moving on to the `SchoolTest`, unskip tests as you come to them and make each of those tests pass.

As you work through this exercise, the classes will eventually respond to the interaction pattern below:

## Student

A student is assigned a house through an attr_accessor - `student.house = :house_name`.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> student = Student.new('Hermione')
#=> #<Student:0x007fa621d0cd38 @house=nil, @name="Hermione">

pry(main)> student.name
#=> "Hermione"

pry(main)> student.house
#=> nil

pry(main)> student.house = :gryffindor

pry(main)> student.house
#=> :gryffindor
```


## Course

The `houses_represented` method should return an unique list of houses for the students enrolled in that course.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> student1 = Student.new('Malfoy')    
#=> #<Student:0x007ffc8333f130 @house=nil, @name="Malfoy">

pry(main)> student1.house = :slytherin    

pry(main)> student2 = Student.new('Ron')    
#=> #<Student:0x007ffc83b00180 @house=nil, @name="Ron">

pry(main)> student2.house = :gryffindor    

pry(main)> student3 = Student.new('Harry')    
#=> #<Student:0x007ffc82a50268 @house=nil, @name="Harry">

pry(main)> student3.house = :gryffindor    

pry(main)> course = Course.new('Potions', 'Severus Snape')    
#=> #<Course:0x007ffc82a807d8 @name="Potions", @professor="Severus Snape", @students=[]>

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
#=> [#<Student:0x007ffc8333f130 @house=:slytherin, @name="Malfoy">,
     #<Student:0x007ffc83b00180 @house=:gryffindor, @name="Ron">,
     #<Student:0x007ffc82a50268 @house=:gryffindor, @name="Harry">]

pry(main)> course.houses_represented
#=> [:slytherin, :gryffindor]
```

## School

A school is created with a `name` and and list of `houses`.  When sorting a student, the school randomly assigns a house to that student.  The `sort_students` method should assign a house to every student enrolled in courses at that school.

```ruby
pry(main)> require './lib/student'
#=> true

pry(main)> require './lib/course'
#=> true

pry(main)> require './lib/school'
#=> true

pry(main)> @student1 = Student.new('Malfoy')
#=> #<Student:0x007fb7a42a4fc8 @house=nil, @name="Malfoy">

pry(main)> @student2 = Student.new('Ron')    
#=> #<Student:0x007fb7a4bc7e20 @house=nil, @name="Ron">

pry(main)> @student3 = Student.new('Harry')    
#=> #<Student:0x007fb7a4be6848 @house=nil, @name="Harry">

pry(main)> @student4 = Student.new('Hermione')    
#=> #<Student:0x007fb7a4c04ed8 @house=nil, @name="Hermione">

pry(main)> @student5 = Student.new('Luna')    
#=> #<Student:0x007fb7a50d8ea0 @house=nil, @name="Luna">

pry(main)> @student6 = Student.new('Penelope')    
#=> #<Student:0x007fb7a4c24940 @house=nil, @name="Penelope">

pry(main)> @student7 = Student.new('Ernie')    
#=> #<Student:0x007fb7a42b41f8 @house=nil, @name="Ernie">

pry(main)> @course1 = Course.new('Potions', 'Severus Snape')    
#=> #<Course:0x007fb7a4a2ea00 @name="Potions", @professor="Severus Snape", @students=[]>

pry(main)> @course1.add_student(@student1)    

pry(main)> @course1.add_student(@student2)    

pry(main)> @course1.add_student(@student3)    

pry(main)> @course2 = Course.new('Defense Against the Dark Arts', 'Remus Lupin')    
#=> #<Course:0x007fb7a4c8d5a8 @name="Defense Against the Dark Arts", @professor="Remus Lupin", @students=[]>

pry(main)> @course2.add_student(@student3)    

pry(main)> @course2.add_student(@student4)    

pry(main)> @course2.add_student(@student5)    

pry(main)> @course3 = Course.new('Herbology', 'Pomona Sprout')    
#=> #<Course:0x007fb7a4cdc9f0 @name="Herbology", @professor="Pomona Sprout", @students=[]>

pry(main)> @course3.add_student(@student5)    

pry(main)> @course3.add_student(@student6)    

pry(main)> @course3.add_student(@student7)    

pry(main)> @school = School.new('Hogwarts', [:gryffindor, :slytherin, :ravenclaw, :hufflepuff])    
#=> #<School:0x007fb7a5ae5268 @courses=[], @houses=[:gryffindor, :slytherin, :ravenclaw, :hufflepuff], @name="Hogwarts">

pry(main)> @school.name
#=> "Hogwarts"

pry(main)> @school.houses
#=> [:gryffindor, :slytherin, :ravenclaw, :hufflepuff]

pry(main)> @school.courses
#=> []

pry(main)> @school.add_course(@course1)

pry(main)> @school.add_course(@course2)

pry(main)> @school.add_course(@course3)

pry(main)> @school.courses
#=> [#<Course:0x007fb7a4a2ea00...>, #<Course:0x007fb7a4c8d5a8...>,#<Course:0x007fb7a4cdc9f0...>]

pry(main)> @school.sort(@student1)

pry(main)> @student1.house
#=> will be one of the 4 houses

pry(main)> @school.sort_students

pry(main)> @student1.house
#=> will be one of the 4 houses

pry(main)> @student2.house
#=> will be one of the 4 houses

pry(main)> @student3.house
#=> will be one of the 4 houses

...

# We are now resetting the students houses, for the last method.
pry(main)> @student1.house = :slytherin    

pry(main)> @student2.house = :gryffindor    

pry(main)> @student3.house = :gryffindor    

pry(main)> @student4.house = :gryffindor    

pry(main)> @student5.house = :ravenclaw    

pry(main)> @student6.house = :ravenclaw    

pry(main)> @student7.house = :hufflepuff    

pry(main)> @school.students_by_house
#=> {:slytherin=>[#<Student:0x007fb7a42a4fc8...>],
#    :gryffindor=>[#<Student:0x007fb7a4bc7e20...>,
#                  #<Student:0x007fb7a4be6848...>,
#                  #<Student:0x007fb7a4c04ed8...>],
#    :ravenclaw=>[#<Student:0x007fb7a50d8ea0...>,
#                 #<Student:0x007fb7a4c24940...>],
#    :hufflepuff=>[#<Student:0x007fb7a42b41f8...>]}
```
